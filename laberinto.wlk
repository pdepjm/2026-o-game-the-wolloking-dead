import wollok.game.*
import direcciones.*
import elementos.*
import trampas.*
import jugador.*
// Objeto para represent el fondo del tablero
object fondo {
    method position() = game.at(0, 0)
    // Nombre del archivo de imagen (debe estar guardado en la carpeta del proyecto)
    method image() = "fondoLaberinto.png"
}
object juegoLaberinto {

    method iniciar() {
        game.title("THE MAZE")
        game.height(12)
        game.width(12)
        game.cellSize(50)

        game.addVisual(fondo)
        self.construirParedes()
        self.colocarTrampasYObjetivos()
        game.addVisual(hudVida)
        game.addVisual(jugador)
        self.configurarTeclas()
    }

    method construirParedes() {
        // marco exterior
        (0..9).forEach({ x => 
            game.addVisual(new Pared(position = game.at(x, 0)))
            game.addVisual(new Pared(position = game.at(x, 11)))
        })
        (1..5).forEach({ y => 
            game.addVisual(new Pared(position = game.at(0, y)))
            game.addVisual(new Pared(position = game.at(11, y)))
        })

        const paredesInternas = [

            // paredes zona inferior (deja libres (1,1), (1,2), (2,1), (3,1))
            game.at(2, 2), game.at(3, 2), game.at(4, 2), game.at(6, 1), game.at(7, 1), game.at(8, 1), game.at(9, 1),

            // pasillos intermedios inferiores
            game.at(2, 4), game.at(3, 4), game.at(4, 4), game.at(6, 3), game.at(7, 3), game.at(8, 3), game.at(10, 3),
            game.at(6, 4), game.at(8, 4), game.at(10, 4),

            // bloques zona central
            game.at(1, 6), game.at(2, 6), game.at(4, 6), game.at(5, 6), game.at(6, 6), game.at(8, 6), game.at(9, 6),
            game.at(2, 5), game.at(4, 5), game.at(8, 5),

            // pasillos intermedios superiores
            game.at(2, 8), game.at(3, 8), game.at(5, 8), game.at(6, 8), game.at(7, 8), game.at(9, 8), game.at(10, 8),
            game.at(1, 7), game.at(3, 7), game.at(5, 7), game.at(7, 7), game.at(9, 7),

            // zona superior previa a la salida en (10, 10)
            game.at(2, 10), game.at(3, 10), game.at(4, 10), game.at(6, 10), game.at(7, 10), game.at(8, 10),
            game.at(2, 9), game.at(4, 9), game.at(6, 9), game.at(8, 9)

        ]
        paredesInternas.forEach({ pos => game.addVisual(new Pared(position = pos)) })
    }

    method colocarTrampasYObjetivos() {
        // salida ubicada al final del recorrido
        game.addVisual(new Salida(position = game.at(10, 10)))

       // --- TRAMPAS DE PINCHOS (-20 HP) en puntos clave obligatorios/estrechos ---
       game.addVisual(new TrampaPinchos(position = game.at(3, 1)))
        game.addVisual(new TrampaPinchos(position = game.at(5, 4)))
        game.addVisual(new TrampaPinchos(position = game.at(7, 6)))
        game.addVisual(new TrampaPinchos(position = game.at(3, 9)))

        // --- TRAMPAS DE PEGAMENTO (Inmovilizan) en intersecciones engañosas ---
       game.addVisual(new TrampaPegamento(position = game.at(5, 2)))
        game.addVisual(new TrampaPegamento(position = game.at(1, 8)))
        game.addVisual(new TrampaPegamento(position = game.at(9, 5)))

        // --- TRAMPAS DE TELETRANSPORTE en falsas salidas y al final del camino equivocado ---
        // Si el jugador toma el pasillo equivocado cerca del final (4, 10) o (9, 9), vuelve al inicio (1, 1)
       game.addVisual(new TrampaTeletransporte(position = game.at(10, 1), destino = game.at(1, 1)))
        game.addVisual(new TrampaTeletransporte(position = game.at(1, 10), destino = game.at(1, 1)))
        game.addVisual(new TrampaTeletransporte(position = game.at(7, 9), destino = game.at(1, 1)))
    }
    method configurarTeclas() {
        keyboard.up().onPressDo({ jugador.intentarMover(arriba) })
        keyboard.down().onPressDo({ jugador.intentarMover(abajo) })
        keyboard.left().onPressDo({ jugador.intentarMover(izquierda) })
        keyboard.right().onPressDo({ jugador.intentarMover(derecha) })
    }
}