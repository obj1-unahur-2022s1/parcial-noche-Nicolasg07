class Plato {
	const property peso=0
	const property valoracion=0
	
	method esAbundante()=  peso > 250
	
	method aptoVegetariano()
}

class Provoleta inherits Plato {
	var property tieneEspecias
	
	override method aptoVegetariano()= not self.tieneEspecias()
	
	method esEspecial()= self.esAbundante() || self.tieneEspecias()
	
	override method valoracion()= if (self.esEspecial()) {120} else {80}
}

class HamburguesaCarne inherits Plato {
	var pan
	
	override method peso()= 250
	
	override method aptoVegetariano()= false
	
	override method valoracion()= 60 + pan.valorPan()
}

object industrial {
	
	method valorPan()= 0
}

object casero {
	
	method valorPan()= 20
}

object masaMadre {
	
	method valorPan()= 45
}

class HamburguesaVegetariana inherits HamburguesaCarne {
	const legumbreHecha
	
	override method aptoVegetariano()= true
	
	method plus()= 17.min(2 * legumbreHecha.size())
	
	override method valoracion()= super() + self.plus()
}

class Parrillada inherits Plato {
	const property cortesDeCarne = []
	
	override method peso()= cortesDeCarne.sum({ cc => cc.peso() })
	
	override method aptoVegetariano()= false
	
	method corteDeMaxCalidad()= cortesDeCarne.max({ cc => cc.calidad() })
	override method valoracion()= 0.max( (15 * self.corteDeMaxCalidad().calidad()) - cortesDeCarne.size() )
}

class CortesDeCarne {
	const property nombre
	const property calidad
	const property peso
}
