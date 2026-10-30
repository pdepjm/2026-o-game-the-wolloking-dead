import direcciones.*

object merodeo {
    var orientacion = "derecha"
    var priorizarIzquierda = true

    method direccionPrincipal() = self.direccionSegun(orientacion)

    method direccionLateralPreferida() =
        if (priorizarIzquierda) {
            self.direccionSegun(self.orientacionIzquierda())
        } else {
            self.direccionSegun(self.orientacionDerecha())
        }

    method direccionLateralAlternativa() =
        if (priorizarIzquierda) {
            self.direccionSegun(self.orientacionDerecha())
        } else {
            self.direccionSegun(self.orientacionIzquierda())
        }

    method direccionOpuesta() =
        self.direccionSegun(self.orientacionOpuesta())

    method direccionesAIntentar() = [
        self.direccionPrincipal(),
        self.direccionLateralPreferida(),
        self.direccionLateralAlternativa(),
        self.direccionOpuesta()
    ]

    method direccionSegun(unaOrientacion) =
        if (unaOrientacion == "arriba") arriba
        else if (unaOrientacion == "derecha") derecha
        else if (unaOrientacion == "abajo") abajo
        else izquierda

    method orientacionIzquierda() =
        if (orientacion == "arriba") "izquierda"
        else if (orientacion == "izquierda") "abajo"
        else if (orientacion == "abajo") "derecha"
        else "arriba"

    method orientacionDerecha() =
        if (orientacion == "arriba") "derecha"
        else if (orientacion == "derecha") "abajo"
        else if (orientacion == "abajo") "izquierda"
        else "arriba"

    method orientacionOpuesta() =
        if (orientacion == "arriba") "abajo"
        else if (orientacion == "derecha") "izquierda"
        else if (orientacion == "abajo") "arriba"
        else "derecha"

    method registrarMovimiento(direccion) {
        const nuevaOrientacion = direccion.orientacion()
        priorizarIzquierda =
            if (nuevaOrientacion != orientacion) !priorizarIzquierda
            else priorizarIzquierda
        orientacion = nuevaOrientacion
    }

    method reiniciar() {
        orientacion = "derecha"
        priorizarIzquierda = true
    }
}