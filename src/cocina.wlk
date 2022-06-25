/*
 * Ojo con la sintaxís tienias mail escrito la palabra filter en los métodos ```lasAptasVegetarianas()``` y ```lasNoAptasVegetarianas()```
 * En tieneBuenaOfertaVegetariana() convenia usar el valor absoluto abs() sobre la resta
 */

import comidas.*
import comensales.*

object cocina {
	const todasLasComidas = []
	
	method lasAptasVegetarianas()= todasLasComidas.filter({ c => c.aptoVegetariano() })
	method lasNoAptasVegetarianas()= todasLasComidas.filter({ c => !c.aptoVegetariano() })
	
	method hayAlmenosMasVegetarianas()= self.lasAptasVegetarianas().size() >= self.lasNoAptasVegetarianas().size()
	method almenosDiferenciaDeDos()= self.lasNoAptasVegetarianas().size() - self.lasAptasVegetarianas().size() <= 2
	
	method tieneBuenaOfertaVegetariana()= self.hayAlmenosMasVegetarianas() || self.almenosDiferenciaDeDos()
	
	method platoFuerteCarnivoro()= self.lasNoAptasVegetarianas().max({ c => c.valoracion() })
	
	method comidasQueLeGustan(unComensal)= todasLasComidas.filter({ c => unComensal.leAgrada(c) })
	
	method elegirPlato(unComensal) {
		if (todasLasComidas.all({ c => !unComensal.leAgrada(c) })) { self.error("No le gusta ninguna comida") }
		self.comidasQueLeGustan(unComensal).anyOne()
	}
}