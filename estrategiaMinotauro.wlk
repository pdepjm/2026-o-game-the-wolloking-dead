import direcciones.*

object merodeo {
    var orientacion = 0

    method direccionesAProbar() =
        if (orientacion == 0) {
            [arriba, derecha, izquierda, abajo]
        } else if (orientacion == 1) {
            [derecha, abajo, arriba, izquierda]
        } else if (orientacion == 2) {
            [abajo, izquierda, derecha, arriba]
        } else {
            [izquierda, arriba, abajo, derecha]
        }

    method registrarMovimiento(indiceElegido) {
        if (indiceElegido == 1) {
            orientacion = orientacion + 1
            if (orientacion == 4) {
                orientacion = 0
            }
        } else if (indiceElegido == 2) {
            orientacion = orientacion - 1
            if (orientacion < 0) {
                orientacion = 3
            }
        } else if (indiceElegido == 3) {
            orientacion = orientacion + 2
            if (orientacion > 3) {
                orientacion = orientacion - 4
            }
        }
    }
}