import wollok.game.*

class Pared {
    var property position
    method image() = "pared.png"
    
    // Invalida el movimiento hacia este casillero
    method esAtravesable() = false
    method interactuar(personaje) {}
}

class Salida {
    var property position
    method image() = "puerta.png"
    method esAtravesable() = true
    
    method interactuar(personaje) {
        game.say(personaje, "¡Escape con exito del laberinto!")
        game.schedule(1500, { game.stop() })
    }
}