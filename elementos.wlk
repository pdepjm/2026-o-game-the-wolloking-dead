import wollok.game.*
import jugador.*

class Pared {
    var property position
    method image() = "transparente.png"
    
    // Invalida el movimiento hacia este casillero
    method esAtravesable() = false
    method interactuar(personaje) {}
}

class Salida {
    var property position
    method image() = "puerta.png"
    method esAtravesable() = true
    
    method interactuar(personaje) {
        personaje.congelarPorVictoria()
        game.addVisual(cartelGanaste)
        game.schedule(2500, { game.stop() })
    }
}