import wollok.game.*

class Trampa {
    var property position
    method esAtravesable() = true
    method interactuar(personaje)
}

class TrampaPinchos inherits Trampa {
    method image() = "trampaPinchos.png"

    override method interactuar(personaje) {
        personaje.reducirVida(20)
        game.say(personaje, "¡Ay! Pinchos (-20 HP)")
    }
}

class TrampaPegamento inherits Trampa {
    method image() = "trampaDePegamento.png"

    override method interactuar(personaje) {
        personaje.paralizar()
        game.say(personaje, "¡Trampa de pegamento!")
    }
}

class TrampaTeletransporte inherits Trampa {
    const destino
    method image() = "portal.png"

    override method interactuar(personaje) {
        personaje.position(destino)
        game.say(personaje, "¡Teletransportado al inicio!")
    }
}
