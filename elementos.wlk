import wollok.game.*
import jugador.*

class Pared {
    var property position
    method image() = "pared.jpg"
    
    // Invalida el movimiento hacia este casillero
    method esAtravesable() = false
    method interactuar(personaje) {}
}

class Salida {
    var property position
    const accionVictoria

    method image() = "puerta.png"
    method esAtravesable() = true
    
    method interactuar(personaje) {
        personaje.congelarPorVictoria()
        accionVictoria.apply()
    }
}