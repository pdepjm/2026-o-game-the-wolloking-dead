import direcciones.*

object cazaDirecta {

    method direccionesAProbar(posicionMinotauro, posicionJugador) {
        const dx = posicionJugador.x() - posicionMinotauro.x()
        const dy = posicionJugador.y() - posicionMinotauro.y()

        if (dx.abs() >= dy.abs()) {
            // Conviene priorizar el movimiento horizontal.
            if (dx > 0) {
                if (dy > 0) {
                    [derecha, arriba, abajo, izquierda]
                } else if (dy < 0) {
                    [derecha, abajo, arriba, izquierda]
                } else {
                    [derecha, arriba, abajo, izquierda]
                }
            } else if (dx < 0) {
                if (dy > 0) {
                    [izquierda, arriba, abajo, derecha]
                } else if (dy < 0) {
                    [izquierda, abajo, arriba, derecha]
                } else {
                    [izquierda, arriba, abajo, derecha]
                }
            } else if (dy > 0) {
                [arriba, derecha, izquierda, abajo]
            } else {
                [abajo, derecha, izquierda, arriba]
            }
        } else {
            // Conviene priorizar el movimiento vertical.
            if (dy > 0) {
                if (dx > 0) {
                    [arriba, derecha, izquierda, abajo]
                } else {
                    [arriba, izquierda, derecha, abajo]
                }
            } else {
                if (dx > 0) {
                    [abajo, derecha, izquierda, arriba]
                } else {
                    [abajo, izquierda, derecha, arriba]
                }
            }
        }
    }
}