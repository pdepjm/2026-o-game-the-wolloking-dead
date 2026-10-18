import wollok.game.*

object movimientoJugador {
    method mover(personaje, direccion) {
        const proximaPos = direccion.siguientePosicion(personaje.position())
        const destino = game.at(proximaPos.x(), proximaPos.y())
        const elementosProximos = game.getObjectsIn(destino)
        const hayPared = elementosProximos.any({ objeto => !objeto.esAtravesable() })

        if (!hayPared) {
            personaje.position(destino)
            elementosProximos.forEach({ objeto => objeto.interactuar(personaje) })
        }
        else{
                    game.say(
            personaje,
            "Bloqueado en (" +
            proximaPos.x().toString() + ", " +
            proximaPos.y().toString() + ")"
        )
        }
    }
}

object estadoLibre {
    method intentarMover(personaje, direccion) {
        movimientoJugador.mover(personaje, direccion)
    }

    method estaParalizado() = false
    method nombre() = "LIBRE"
    method liberar(personaje) {}
}

object estadoPegado {
    method intentarMover(personaje, direccion) {}
    method estaParalizado() = true
    method nombre() = "PEGADO"

    method liberar(personaje) {
        personaje.estado(estadoLibre)
    }
}

object estadoFinalizado {
    method intentarMover(personaje, direccion) {}
    method estaParalizado() = false
    method nombre() = "FINALIZADO"
    method liberar(personaje) {}
}

object jugador {
    var property position = game.at(1, 1)
    var property vida = 100
    var property estado = estadoLibre

    method image() = "jugador.png"
    method esAtravesable() = true

    method intentarMover(direccion) = estado.intentarMover(self, direccion)
    method estaParalizado() = estado.estaParalizado()

    method reducirVida(cantidad) {
        vida = (vida - cantidad).max(0)
        if (vida == 0) {
            game.addVisual(cartelDerrota)
            game.schedule(1500, { game.stop() })
        }
    }

    method paralizar() {
        estado = estadoPegado
        game.schedule(5000, { self.liberarDeParalisis() })
    }

    method capturarPorMinotauro() {
        estado = estadoFinalizado
    }

    method liberarDeParalisis() {
        estado.liberar(self)
        game.say(self, "Me liberé del pegamento")
    }

    method congelarPorVictoria() {
        estado = estadoFinalizado
    }
}

object hudVida {
    method position() = game.at(10, 9)
    method esAtravesable() = true
    method text() = "VIDA " + jugador.vida().toString() + "/100 | " + jugador.estado().nombre()
    method textColor() =
        if (jugador.vida() <= 25) "FF4D4DFF"
        else if (jugador.vida() <= 60) "FFC857FF"
        else "56D98AFF"
}

object cartelDerrota {
    method position() = game.at(2, 2)
    method image() = "perdiste.png"
    method esAtravesable() = true
    
}
object cartelGanaste {
    method position() = game.at(1, 1)
    method image() = "ganaste.png"
    method esAtravesable() = true
}