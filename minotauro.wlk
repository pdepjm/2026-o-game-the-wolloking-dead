import wollok.game.*
import jugador.*
import direcciones.*
import estrategiaMinotauro.*

object minotauro {
    var property position = game.at(9, 3)
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
        game.schedule(250, {
            self.mover()
        })
    }

    method merodear() {
        var seMovio = self.intentarMoverYRegistrar(estrategia.direccionPrincipal())
        seMovio = if (seMovio) true
            else self.intentarMoverYRegistrar(estrategia.direccionLateralPreferida())
        seMovio = if (seMovio) true
            else self.intentarMoverYRegistrar(estrategia.direccionLateralAlternativa())
        seMovio = if (seMovio) true
            else self.intentarMoverYRegistrar(estrategia.direccionOpuesta())

        if (self.estaEnLaMismaCasilla(jugador)) {
            self.atacarSiPuede(jugador)
        }
    }

    method intentarMoverYRegistrar(direccion) {
        const seMovio = self.intentarMoverEn(direccion)
        if (seMovio) {
            estrategia.registrarMovimiento(direccion)
            return true
        } else {
            return false
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
            return false
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
                return true
            } else {
                return false
            }
        }
    }

    method iniciarPersecucion() {
        game.schedule(700, {
            self.mover()
        })
    }
}
