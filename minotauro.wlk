import wollok.game.*
import jugador.*
import estrategiasMinotauro.*
import direcciones.*

object minotauro {
    var property position = game.at(8, 2)
    var estrategia = cazaDirecta
    var dano = 25

    var puedeAtacar = true

    method image() = "minotauro.png"

    method esAtravesable() = true

    method cambiarEstrategia(nuevaEstrategia) {
        estrategia = nuevaEstrategia
    }

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
        if (self.estaEnLaMismaCasilla(jugador)) {
            self.atacarSiPuede(jugador)
        } else {
            self.perseguirJugador()
        }

        game.schedule(700, {
            self.mover()
        })
    }

    method perseguirJugador() {
        const posicionActual = new Posicion(
            x = position.x(),
            y = position.y()
        )

        const posicionJugador = new Posicion(
            x = jugador.position().x(),
            y = jugador.position().y()
        )

        const direcciones = estrategia.direccionesAProbar(
            posicionActual,
            posicionJugador
        )

        var seMovio = false

        direcciones.forEach({ direccion =>
            if (!seMovio) {
                seMovio = self.intentarMoverEn(direccion)
            }
        })

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

    method iniciarPersecucion() {
        game.schedule(700, {
            self.mover()
        })
    }
}