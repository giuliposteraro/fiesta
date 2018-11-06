class Fiesta{
	var lugar 
	var property fecha = new Date(6,11,18)
	var invitados = []
	method esUnBodrio(){
		invitados.all{invitado => not invitado.estaConforme(invitado,self)}
	}
	method mejorDisfraz(){
		invitados.max{disfraz => disfraz.puntos(invitados,self)}
	}
	method intercambiarTrajes(invitado1,invitado2){
		invitado1.cambiarDisfraz(invitado2.disfraz()) 
		invitado2.cambiarDisfraz(invitado1.disfraz())
	}
	method estaEnLaFiesta(invitado){
		return invitados.contains(invitado)
	}
	method estaDisconforme(unAsis,otroAsis){
		invitados.any{invitado => not invitado.estaConforme(invitado,self)}
	}
	method puedenIntercambiarTrajes(unAsis,otroAsis){
		self.estaEnLaFiesta(unAsis)
		self.estaEnLaFiesta(otroAsis)
		self.estaDisconforme(unAsis,otroAsis)
		self.intercambiarTrajes(unAsis,otroAsis)
		if(unAsis.estaConforme(unAsis,self) and otroAsis.estaConforme(otroAsis,self)){
			return true
		}
			return not self.intercambiarTrajes(unAsis,otroAsis)
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
		asistente.estaConforme(asistente,self)
		return super(asistente)	
	}
}

class Invitado{
	var property disfraz 
	var property edad
	var personalidad
	var property estaCargado
	method personaSexie(){
		return personalidad.esSexie(self)
	}
	method estaConforme(invitado,fiesta){
		return disfraz.puntos(invitado,fiesta) > 10 
	}
	method tieneDisfraz(){
		return not disfraz.isEmpty()
	}
	method cambiarDisfraz(nuevo){
		disfraz = nuevo
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
	var hoyMeLevante = personaAlegre 
	method esSexie(persona){
		hoyMeLevante.esSexie(persona)
	}
}

class Caprichoso inherits Invitado{
	override method estaConforme(invitado,fiesta){
		return super(invitado,fiesta) and disfraz.nombre().esPar()   
	}
}

class Pretencioso inherits Invitado{
	override method estaConforme(invitado,fiesta){
		return super(invitado,fiesta) and disfraz.fecha() < 30
	}
}

class Numerologo inherits Invitado{
	var cifra
	override method estaConforme(invitado,fiesta){
		return super(invitado,fiesta) and disfraz.puntos(self,fiesta) == cifra 
	}
}
class Disfraz{
	var property nombre
	var property fecha = new Date(9,10,18)
	var caracteristicas = []
	method puntos(invitado,fiesta){
		return caracteristicas.sum{disfraz => disfraz.puntosPorDisfraz(self,invitado,fiesta)}
	}
	method esPar(){
		return (nombre.size() / 2) == 0
	}
}

object disfrazGracioso{
	var nivelGracia = 100
	method puntosPorDisfraz(disfraz,invitado,fiesta){
		return nivelGracia * self.personaQueLoLleva(invitado)
	}
	method personaQueLoLleva(invitado) {
		if(invitado.edad() <= 50){
			return 1
		}
			return 3
	}
}

object disfrazTobara{
	var property diaCompra = new Date(4,12,18) 
	method puntosPorDisfraz(disfraz,invitado,fiesta){ 
		if(fiesta.fecha() - self.diaCompra() < 2){
			return 3
		}
			return 5
	}
}

object disfrazCareta{
	method puntosPorDisfraz(disfraz,invitado,fiesta){
		return personaje.valor()
	}
}

object personaje{
	var property valor = 20 
}

object disfrazSexie{
	method puntosPorDisfraz(disfraz,invitado,fiesta){
		if(!invitado.personaSexie()){
			2
		}
			return 15
	}
}
