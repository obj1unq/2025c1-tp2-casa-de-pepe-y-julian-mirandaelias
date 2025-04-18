
/*############# Categoria ###########*/
object electrodomestico{
}

object mueble {
}

object comida {

}

/*############# Cosas ###########*/

object heladera {
	method precio() {
		return 20000
	}
	method categoria() { 
		return electrodomestico
	}

	method esComestible(){
		return self.categoria() == comida
	} 
	
}

object cama {
	method precio() {
		return 8000
	}

	method categoria() {
		return mueble
	}

	method esComestible(){
		return self.categoria() == comida
	}
}

object tiraDeAsado {
	
	method precio() {
		return 350 
	}
	method categoria() { 
		return comida
	}
	method esComestible(){
		return self.categoria() == comida
	}
}

object paqueteDeFideos {
	method precio() { 
		return 50 
	}
	
	method categoria() {
		return comida 
	}
	method esComestible(){
		return self.categoria() == comida
	}
	
}

object plancha {
	method precio() {
		return 1200 
	}
	
	method categoria() {
		return electrodomestico 
	}
	method esComestible(){
		return self.categoria() == comida
	}
}
