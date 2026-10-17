import wollok.game.*
import jugador.*
import direcciones.*
import estrategiaMinotauro.*

object minotauro {
    var property position = game.at(9, 9)
    const estrategia = merodeo
    const dano = 100

    var puedeAtacar = true

    method image() = "minotauro.png"

    method esAtravesable() = true

    method estaEnLaMismaCasilla(personaje) {
        return position.x() == personaje.position().x() &&
        position.y() == personaje.position().y()
    }

    method interactuar(personaje) {
        self.atacarSiPuede(personaje)
    }

    method atacarSiPuede(personaje) {
        if (puedeAtacar) {
            puedeAtacar = false

            personaje.capturarPorMinotauro()
            personaje.reducirVida(dano)

            game.say(
                personaje,
                "¡El Minotauro me atacó! -" + dano.toString() + " HP"
            )

            game.schedule(1500, {
                self.habilitarAtaque()
            })
        }
    }

    method habilitarAtaque() {
        puedeAtacar = true
    }

    method mover() {
        self.merodear()
        game.schedule(700, {
            self.mover()
        })
    }

    method merodear() {
        const direcciones = estrategia.direccionesAProbar()
        var seMovio = false
        var indiceElegido = 0

        direcciones.forEach({ direccion =>
            if (!seMovio) {
                seMovio = self.intentarMoverEn(direccion)
                if (seMovio) {
                    estrategia.registrarMovimiento(indiceElegido)
                } else {
                    indiceElegido = indiceElegido + 1
                }
            }
        })

        if (!seMovio) {
            estrategia.registrarMovimiento(1)
        }

        if (self.estaEnLaMismaCasilla(jugador)) {
            self.atacarSiPuede(jugador)
        }
    }

    method intentarMoverEn(direccion) {
        const proximaPosicion =
            direccion.siguientePosicion(
                new Posicion(
                    x = position.x(),
                    y = position.y()
                )
            )

        if (proximaPosicion.x() <= 0 || proximaPosicion.x() >= 11 ||
            proximaPosicion.y() <= 0 || proximaPosicion.y() >= 11) {
            false
        } else {
            const destino = game.at(
                proximaPosicion.x(),
                proximaPosicion.y()
            )

            const objetosDestino = game.getObjectsIn(destino)

            const hayPared = objetosDestino.any({
                objeto => !objeto.esAtravesable()
            })

            if (!hayPared) {
                position = destino
                true
            } else {
                false
            }
        }
    }

    method iniciarPersecucion() {
        game.schedule(700, {
            self.mover()
        })
    }
}