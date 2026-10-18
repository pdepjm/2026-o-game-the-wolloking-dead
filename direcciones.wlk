class Posicion {
    const property x
    const property y

    method mover(direccion) = direccion.siguientePosicion(self)
}

object arriba {
    method orientacion() = 0
    method siguientePosicion(pos) = new Posicion(x = pos.x(), y = pos.y() + 1)
}

object abajo {
    method orientacion() = 2
    method siguientePosicion(pos) = new Posicion(x = pos.x(), y = pos.y() - 1)
}

object izquierda {
    method orientacion() = 3
    method siguientePosicion(pos) = new Posicion(x = pos.x() - 1, y = pos.y())
}

object derecha {
    method orientacion() = 1
    method siguientePosicion(pos) = new Posicion(x = pos.x() + 1, y = pos.y())
}