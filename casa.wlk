import cosas.* 

object casaDePepeYJulian {
    var property cosasCompradas = [] 
    var property cuenta = cuentaCorriente
    var property cantComidasAComprar = 2

    method comprar(cosa) {
    self.extraer(cosa.precio())
    cosasCompradas.add(cosa)
    
    }

    method cantidadDeCosasCompradas() {
    
    return cosasCompradas.size()

    }

    method tieneAlgun(categoria){
        
        return cosasCompradas.any({cosa=>cosa.categoria() == categoria })

    } 

    method vieneDeComprar(categoria){ 
      //  return if (cosasCompradas.isEmpty()) false else       miedo al booleano, el false 
      //      cosasCompradas.last().categoria() == categoria    ya lo da el categoria()= categoria
        self.validarVieneDeComprar()
        return cosasCompradas.last().categoria() == categoria
    } 

    method validarVieneDeComprar() {
        if (cosasCompradas.isEmpty()) {
        self.error ("Todavia no compraste nada") 
        }
    }

    method esDerrochona(){
        return cosasCompradas.sum({cosa => cosa.precio()}) > 9000
    } 

    method compraMasCara() {
        self.validarCompraMasCara()
        return cosasCompradas.max({cosa => cosa.precio()})
    }
    
    method validarCompraMasCara() {
        if (cosasCompradas.isEmpty()) {
        self.error ("Todavia no compraste nada") 
        }
    }

    method comprados(categoria) {
        return cosasCompradas.filter({cosa => cosa.categoria() == categoria})
    }

    method malaEpoca() {
        return cosasCompradas.all({cosa => cosa.esComestible()})
    }

    method queFaltaComprar(lista){
        return  lista.filter({cosa =>not  cosasCompradas.contains(cosa)})
    } 

    method faltaComida(){
        return self.comidasCompradas().size() < cantComidasAComprar
    } 

    method comidasCompradas() {
        return cosasCompradas.filter({cosa => cosa.esComestible()})
    }

    method categoriasCompradas() { //revisar
        return (cosasCompradas.map({cosa => cosa.categoria()})).asSet() 
    }
    
    method depositar(monto) {
        cuenta.depositar(monto)
    }

    method extraer(monto) {
        cuenta.extraer(monto)
    }
    method saldo(){
        return cuenta.saldo()
    } 

    } 

object cuentaCorriente {
    var property saldo = 20 

    method depositar(monto) {
        
        saldo += monto 

    }

    method extraer(monto) {
        self.validarExtraccion(monto)
        saldo -= monto
    }

    method validarExtraccion(monto) {
        if(saldo < monto){
            self.error("No hay suficiente saldo en la cuenta")
        }
    } 
}

object cuentaConGastos {
    var  property saldo = 500
    const costo = 20

    method depositar(monto){
        self.validarDeposito(monto)
        saldo += monto - costo
    } 

    method validarDeposito(monto) {
        if(monto > 1000){
            self.error("No es posible depositar mas de 1000")
        }
    } 

    method extraer(monto) {
        saldo -=  monto
    }
}                       

