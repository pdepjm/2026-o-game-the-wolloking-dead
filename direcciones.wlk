class Posicion {
    const property x
    const property y

    method mover(direccion) = direccion.siguientePosicion(self)
}

object arriba {
    method siguientePosicion(pos) = new Posicion(x = pos.x(), y = pos.y() + 1)
}

object abajo {
    method siguientePosicion(pos) = new Posicion(x = pos.x(), y = pos.y() - 1)
}

object izquierda {
    method siguientePosicion(pos) = new Posicion(x = pos.x() - 1, y = pos.y())
}

object derecha {
    method siguientePosicion(pos) = new Posicion(x = pos.x() + 1, y = pos.y())
}