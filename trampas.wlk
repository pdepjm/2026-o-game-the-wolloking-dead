import wollok.game.*

class TrampaPinchos {
    var property position
    method image() = "trampaPinchos.png"
    method esAtravesable() = true
    
    method interactuar(personaje) {
        personaje.reducirVida(20)
        game.say(personaje, "¡Ay! Pinchos (-20 HP)")
    }
}

class TrampaPegamento {
    var property position
    method image() = "trampaDePegamento.png"
    method esAtravesable() = true
    
    method interactuar(personaje) {
        personaje.paralizar()
        game.say(personaje, "¡Trampa de pegamento!")
    }
}

class TrampaTeletransporte {
    var property position
    const destino
    method image() = "portal.png"
    method esAtravesable() = true
    
    method interactuar(personaje) {
        personaje.position(destino)
        game.say(personaje, "¡Teletransportado al inicio!")
    }
}