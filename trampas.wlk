import wollok.game.*

class Trampa {
    var property position
    method esAtravesable() = true
    method imagen() = "trampa.png"
    method image() = self.imagen()
    method interactuar(personaje) 
}

class TrampaPinchos inherits Trampa {
    override method imagen() = "trampaPinchos.png"

    override method interactuar(personaje) {
        personaje.reducirVida(20)
        game.say(personaje, "¡Ay! Pinchos (-20 HP)")
    }
}

class TrampaPegamento inherits Trampa {
    override method imagen() = "trampaDePegamento.png"

    override method interactuar(personaje) {
        personaje.paralizar()
        game.say(personaje, "¡Trampa de pegamento!")
    }
}

class TrampaTeletransporte inherits Trampa {
    const destino
    override method imagen() = "portal.png"

    override method interactuar(personaje) {
        personaje.position(destino)
        game.say(personaje, "¡Teletransportado al inicio!")
    }
}
