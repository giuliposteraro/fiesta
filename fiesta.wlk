class Fiesta{
	var lugar
	var fecha = new Date()
	var invitados = []
	method esUnBodrio(){
		invitados.all{invitado => not invitado.estaConforme()}
	}
	method mejorDisfraz(){
		invitados.max{disfraz => disfraz.puntos()}
	}
	method intercambiarTrajes(unAsis,otroAsis){
		self.estaEnLaFiesta(unAsis)
		self.estaEnLaFiesta(otroAsis)
		self.estaDisconforme(unAsis,otroAsis)
	}
	method estaEnLaFiesta(invitado){
		return invitados.contains(invitado)
	}
	method estaDisconforme(unAsis,otroAsis){
		invitados.any{invitado => not invitado.estaConforme()}
	}
	method puedenCambiarTrajes(unAsis,otroAsis){
		self.intercambiarTrajes(unAsis,otroAsis)
		unAsis.estaConforme()
		return otroAsis.estaConforme()
	}
	method agregarAsistente(asistente){
		asistente.tieneDisfraz()
		not asistente.estaCargado()
		return invitados.add(asistente)
	}
}

class Inolvidable inherits Fiesta{
	override method agregarAsistente(asistente){
		asistente.personaSexie()
		asistente.estaConforme()
		return super(asistente)	
	}
}

class Invitado{
	var disfraz 
	var property edad
	var personalidad
	var property estaCargado
	method personaSexie(){
		return personalidad.esSexie(self)
	}
	method estaConforme(){
		return disfraz.puntos() > 10
	}
	method tieneDisfraz(){
		return not disfraz.isEmpty()
	}
	
}

object personaAlegre{
	 method esSexie(persona){
		return false
	}
}

object personaTaciturna{
	 method esSexie(persona){
		return persona.edad() < 30
	}
}

object personaCambiante{
	var hoyMeLevante
	method esSexie(persona){
		hoyMeLevante.esSexie(persona)
	}
}

class Caprichoso inherits Invitado{
	override method estaConforme(){
		super()
		return disfraz.nombre().esPar()   
	}
}

class Pretencioso inherits Invitado{
	override method estaConforme(){
		super()
		// el disfraz debe tener menos de 30 dias, nose como poner eso
	}
}

class Numerologo inherits Invitado{
	var cifra
	override method estaConforme(){
		super()
		return disfraz.puntos() == cifra
	}
}
class Disfraz{
	var property nombre
	var fecha
	var caracteristicas = []
	method puntos(){
		return caracteristicas.sum{disfraz => disfraz.puntosPorDisfraz(self)}
	}
	method esPar(){
		return (nombre.size() / 2) == 0
	}
}

object disfrazGracioso{
	var nivelGracia 
	method puntosPorDisfraz(disfraz,invitado){
		return nivelGracia * disfraz.personaQueLoLleva(invitado)
	}
	method personaQueLoLleva(invitado) {
		if(invitado.edad() <= 50){
			 1
		}
			return 3
	}
}

object disfrazTobara{
	var property diaCompra 
	method puntosPorDisfraz(disfraz,invitado){ // no se como poner si fue comprado 2 o mas dias antes de la fiesta
	}
}

object disfrazCareta{
	var personaje
	method puntosPorDisfraz(disfraz,invitado){
		return personaje.valor()
	}
}

object personaje{
	var property valor
}

object disfrazSexie{
	method puntosPorDisfraz(disfraz,invitado){
		if(!invitado.personaSexie()){
			2
		}
			return 15
	}
}



