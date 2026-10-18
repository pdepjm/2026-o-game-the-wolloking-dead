import direcciones.*

object merodeo {
    var orientacion = 1
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

    method direccionSegun(unaOrientacion) =
        if (unaOrientacion == 0) arriba
        else if (unaOrientacion == 1) derecha
        else if (unaOrientacion == 2) abajo
        else izquierda

    method orientacionIzquierda() =
        if (orientacion == 0) 3 else orientacion - 1

    method orientacionDerecha() =
        if (orientacion == 3) 0 else orientacion + 1

    method orientacionOpuesta() =
        if (orientacion < 2) orientacion + 2
        else orientacion - 2

    method registrarMovimiento(direccion) {
        const nuevaOrientacion = direccion.orientacion()
        priorizarIzquierda =
            if (nuevaOrientacion != orientacion) !priorizarIzquierda
            else priorizarIzquierda
        orientacion = nuevaOrientacion
    }
}