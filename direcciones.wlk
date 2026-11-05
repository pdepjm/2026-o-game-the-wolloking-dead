class Posicion {
    const property x
    const property y

    method mover(direccion) = direccion.siguientePosicion(self)
}

object arriba {
    method siguientePosicion(pos) = new Posicion(x = pos.x(), y = pos.y() + 1)
    method aLaIzquierda() = izquierda
    method aLaDerecha() = derecha
    method opuesta() = abajo
}

object abajo {
    method siguientePosicion(pos) = new Posicion(x = pos.x(), y = pos.y() - 1)
    method aLaIzquierda() = derecha
    method aLaDerecha() = izquierda
    method opuesta() = arriba
}

object izquierda {
    method siguientePosicion(pos) = new Posicion(x = pos.x() - 1, y = pos.y())
    method aLaIzquierda() = abajo
    method aLaDerecha() = arriba
    method opuesta() = derecha
}

object derecha {
    method siguientePosicion(pos) = new Posicion(x = pos.x() + 1, y = pos.y())
    method aLaIzquierda() = arriba
    method aLaDerecha() = abajo
    method opuesta() = izquierda
}