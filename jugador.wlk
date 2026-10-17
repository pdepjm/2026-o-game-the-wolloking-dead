import wollok.game.*

object jugador {
    var property position = game.at(1, 1)
    var property vida = 100
    var property estaParalizado = false
    var property gano = false

    method image() = "jugador.png"

    method intentarMover(direccion) {
        if (!gano) {
           
        if (estaParalizado) {
            return
        }
        else
        {
        const proximaPos = direccion.siguientePosicion(position)
        const destino = game.at(proximaPos.x(), proximaPos.y())

        const elementosProximos = game.getObjectsIn(destino)
        const hayPared = elementosProximos.any({ obj => !obj.esAtravesable() })

        if (!hayPared) {
            position = destino
            elementosProximos.forEach({ obj => obj.interactuar(self) })
        }
        }
        }
    }

    method reducirVida(cantidad) {
        vida = (vida - cantidad).max(0)
        if (vida == 0) {
            game.addVisual(cartelDerrota)
            game.schedule(1500, { game.stop() })
        }
    }

    method paralizar() {
        estaParalizado = true
        game.schedule(5000, { self.liberarDeParalisis() })
    }

    method liberarDeParalisis() {
        estaParalizado = false
        game.say(self, "Me liberé del pegamento")
    }
    method congelarPorVictoria() {
        gano = true
    }
}

object hudVida {
    method position() = game.at(10, 9)
    method text() = "HP: " + jugador.vida().toString() + "/100 | " + if (jugador.estaParalizado()) "PARALIZADO" else "OK"
    method textColor() = "00FF00FF"
}

object cartelDerrota {
    method position() = game.at(2, 2)
    method image() = "perdiste.png"
    
}
object cartelGanaste {
    method position() = game.at(1, 1)
    method image() = "ganaste.png"
}