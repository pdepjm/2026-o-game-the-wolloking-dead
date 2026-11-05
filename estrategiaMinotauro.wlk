import direcciones.*

object preferenciaIzquierda {
    method lateralPreferida(direccion) = direccion.aLaIzquierda()
    method lateralAlternativa(direccion) = direccion.aLaDerecha()
    method invertida() = preferenciaDerecha
    method priorizaIzquierda() = true
}

object preferenciaDerecha {
    method lateralPreferida(direccion) = direccion.aLaDerecha()
    method lateralAlternativa(direccion) = direccion.aLaIzquierda()
    method invertida() = preferenciaIzquierda
    method priorizaIzquierda() = false
}

object merodeo {
    var direccionActual = derecha
    var preferenciaLateral = preferenciaIzquierda

    method priorizarIzquierda() = preferenciaLateral.priorizaIzquierda()

    method direccionPrincipal() = direccionActual

    method direccionLateralPreferida() =
        preferenciaLateral.lateralPreferida(direccionActual)

    method direccionLateralAlternativa() =
        preferenciaLateral.lateralAlternativa(direccionActual)

    method direccionOpuesta() = direccionActual.opuesta()

    method direccionesAIntentar() = [
        self.direccionPrincipal(),
        self.direccionLateralPreferida(),
        self.direccionLateralAlternativa(),
        self.direccionOpuesta()
    ]

    method registrarMovimiento(direccion) {
        if (direccion != direccionActual) {
            preferenciaLateral = preferenciaLateral.invertida()
        }
        direccionActual = direccion
    }

    method reiniciar() {
        direccionActual = derecha
        preferenciaLateral = preferenciaIzquierda
    }
}