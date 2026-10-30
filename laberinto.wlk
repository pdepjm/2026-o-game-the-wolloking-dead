import wollok.game.*
import direcciones.*
import elementos.*
import trampas.*
import jugador.*
import minotauro.*

object fondo {
    var property imagen = "fondo.jpg.jpg"

    method position() = game.at(0, 0)
    method image() = imagen
}

object tituloInicio {
    var property imagen = "PantallaInicio.jpg"

    method position() = game.at(0, 0)
    method image() = imagen
}

object juegoLaberinto {
    var partidaIniciada = false
    var property nivelActual = 1
    var elementosDelNivel = []

    const property matrices = [
        [
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5, 1],
            [1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1],
            [1, 1, 0, 1, 1, 0, 1, 4, 1, 0, 1, 1],
            [1, 1, 4, 0, 0, 0, 0, 2, 0, 0, 1, 1],
            [1, 1, 1, 1, 1, 3, 1, 1, 1, 2, 1, 1],
            [1, 1, 1, 4, 1, 3, 1, 1, 1, 0, 1, 1],
            [1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1, 1],
            [1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1],
            [1, 0, 0, 0, 0, 0, 1, 4, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        ],
        [
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5, 1],
            [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 1, 1, 0, 1, 1, 1, 1, 1, 3, 0, 1],
            [1, 1, 4, 0, 1, 4, 1, 1, 1, 0, 1, 1],
            [1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 1, 1],
            [1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1],
            [1, 0, 0, 0, 2, 3, 0, 0, 0, 0, 1, 1],
            [1, 0, 1, 0, 0, 1, 0, 1, 4, 1, 1, 1],
            [1, 0, 1, 0, 1, 1, 4, 1, 1, 1, 1, 1],
            [1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        ],
        [
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 4, 0, 5, 1],
            [1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 3, 1, 2, 0, 1],
            [1, 1, 1, 1, 1, 1, 4, 2, 1, 0, 1, 1],
            [1, 0, 0, 0, 0, 0, 0, 3, 3, 0, 1, 1],
            [1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1],
            [1, 0, 1, 4, 1, 1, 1, 0, 1, 1, 1, 1],
            [1, 0, 1, 4, 1, 1, 1, 0, 1, 1, 1, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        ],
        [
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 5, 1],
            [1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 1, 1, 1, 0, 1, 1, 4, 1, 0, 1, 1],
            [1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1],
            [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1],
            [1, 1, 0, 1, 0, 1, 2, 4, 1, 3, 1, 1],
            [1, 1, 1, 1, 0, 1, 1, 4, 1, 0, 1, 1],
            [1, 0, 0, 0, 2, 0, 3, 0, 0, 0, 1, 1],
            [1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1],
            [1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        ],
        [
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 4, 0, 5, 1],
            [1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1],
            [1, 1, 4, 1, 1, 1, 3, 1, 1, 2, 0, 1],
            [1, 1, 0, 1, 1, 1, 2, 1, 1, 0, 1, 1],
            [1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1, 1],
            [1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1],
            [1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1],
            [1, 0, 1, 1, 1, 1, 0, 4, 1, 1, 1, 1],
            [1, 0, 1, 4, 1, 1, 0, 1, 1, 1, 1, 1],
            [1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        ]
    ]

    method iniciar() {
        game.title("THE MAZE")
        game.height(12)
        game.width(12)
        game.cellSize(50)

        game.addVisual(fondo)
        game.addVisual(tituloInicio)
        game.onClickDo({ posicion =>
            if (!partidaIniciada && posicion.y() == 3 && posicion.x() >= 5 && posicion.x() <= 8) {
                self.comenzar()
            }
        })
    }

    method comenzar() {
        partidaIniciada = true
        game.removeVisual(tituloInicio)
        game.addVisual(jugador)
        game.addVisual(minotauro)
        self.cargarNivel()
        minotauro.iniciarPersecucion()
        self.configurarTeclas()
    }

    method cargarNivel() {
        elementosDelNivel.forEach({ elemento =>
            if (game.hasVisual(elemento)) {
                game.removeVisual(elemento)
            }
        })
        elementosDelNivel = []

        if (game.hasVisual(cartelGanaste)) {
            game.removeVisual(cartelGanaste)
        }

        jugador.reiniciarNivel()
        minotauro.reiniciarNivel()
        self.dibujarMatriz(matrices.get(nivelActual - 1))
        if (game.hasVisual(hudVida)) {
            game.removeVisual(hudVida)
        }
        game.addVisual(hudVida)
    }

    method avanzarNivel() {
        if (nivelActual < matrices.size()) {
            nivelActual = nivelActual + 1
            self.cargarNivel()
            game.say(jugador, "Nivel " + nivelActual.toString())
        } else {
            game.addVisual(cartelGanaste)
            game.say(jugador, "¡Completaste todos los niveles!")
            game.schedule(1500, {
                game.stop()
            })
        }
    }

    method dibujarMatriz(matriz) {
        (0..11).forEach({ indiceFila =>
            const y = 11 - indiceFila
            const fila = matriz.get(indiceFila)
            (0..11).forEach({ x =>
                self.agregarElemento(fila.get(x), x, y)
            })
        })
    }

    method agregarElemento(tipo, x, y) {
        const posicion = game.at(x, y)
        if (tipo == 1) {
            self.agregarVisualDelNivel(new Pared(position = posicion))
        } else if (tipo == 2) {
            self.agregarVisualDelNivel(new TrampaPegamento(position = posicion))
        } else if (tipo == 3) {
            self.agregarVisualDelNivel(new TrampaPinchos(position = posicion))
        } else if (tipo == 4) {
            self.agregarVisualDelNivel(new TrampaTeletransporte(
                position = posicion,
                destino = game.at(1, 1)
            ))
        } else if (tipo == 5) {
            self.agregarVisualDelNivel(new Salida(
                position = posicion,
                accionVictoria = { self.avanzarNivel() }
            ))
        }
    }

    method agregarVisualDelNivel(elemento) {
        elementosDelNivel.add(elemento)
        game.addVisual(elemento)
    }

    method configurarTeclas() {
        keyboard.up().onPressDo({ jugador.intentarMover(arriba) })
        keyboard.down().onPressDo({ jugador.intentarMover(abajo) })
        keyboard.left().onPressDo({ jugador.intentarMover(izquierda) })
        keyboard.right().onPressDo({ jugador.intentarMover(derecha) })
    }
}
