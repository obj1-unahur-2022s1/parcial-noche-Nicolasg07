import comidas.*

class Comensales {
	const peso
	const comidasQueComio = []
	
	method leAgrada(unaComida)
	
	method comer(unaComida)= comidasQueComio.add(unaComida)
	
	method condicionAdicional()
	method estaSatisfecho()= comidasQueComio.sum({ c => c.peso() }) >= peso * 0.01  && self.condicionAdicional()
}

class Vegetariano inherits Comensales {
	
	override method leAgrada(unaComida)= unaComida.aptoVegetariano() && unaComida.valoracion() > 85
	
	override method condicionAdicional()= comidasQueComio.all({ c => !c.esAbundante() })
}

class HambrePopular inherits Comensales {
	
	override method leAgrada(unaComida)= unaComida.esAbundante()
	
	override method condicionAdicional()= true
}

class PaladarFino inherits Comensales {
	
	override method leAgrada(unaComida)= unaComida.peso().between(150, 300) && unaComida.valoracion() > 100
	
	override method condicionAdicional()= comidasQueComio.size() % 2 == 0
}
