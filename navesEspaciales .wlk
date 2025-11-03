class Nave {
  var velocidad=0
  var direccionRespectoAlSol =0
  method acelerar(cuanto){
    velocidad=(velocidad+cuanto).min(100000)
  }

  method desacelerar(cuanto){
    velocidad=(velocidad-cuanto).max(0)
  }


  method irHaciaElSol(){
    direccionRespectoAlSol=10
  }

   method escaparDelSol(){
    direccionRespectoAlSol=-10
   }

    method ponerseParaleloAlSol(){
    direccionRespectoAlSol=0
  }

  method acercarseUnPocoAlSol(){
    (direccionRespectoAlSol +1).min(10)
  }

   method alejarseUnPocoAlSol(){
    (direccionRespectoAlSol -1).max(-10)
  }
  
  method prepararViaje()// es metodo abstracto
}

class Nave-Baliza inherits Nave{
  var color

  method cambiarColorDeBaliza(colorNuevo){
    color=colorNuevo
  }
  method color()=color
   override method prepararViaje(){
    self.cambiarColorDeBaliza("verde") and self.ponerseParaleloAlSol()
  }
}

class NavePasajeros inherits Nave{
  var cantPasajeros
  var cantComidas
  var cantBebidas

  method cargarComida(cantidad){
   cantComidas=(cantComidas + cantidad)
  }

  method descargarComida(cantidad){
   cantComidas=(cantComidas - cantidad)
  }
  
    method cargarBebidad(cantidad){
   cantBebidas=(cantBebidas + cantidad)
  }

  method descargarBebidas(cantidad){
   cantBebidas=(cantBebidas - cantidad)
  }

  override method prepararViaje(){
    self.cantComidas(4*cantPasajeros)
    self.cantBebidas(6* cantPasajeros)
    self.acercarseUnPocoAlSol()
  }
}

class NaveDeCombate inherits Nave{
   var estaInvisible=false
   var misilesDesplegados=false
   const property mensajesEmitidos=[]
   method ponerseVisible(){
    estaInvisible=false
   }

   method ponerseInvisible(){
    estaInvisible=true
   }
   method estaInvisible()=estaInvisible

   method desplegarMisiles(){
    misilesDesplegados=true
   }

   method replegarMisiles(){
    misilesDesplegados=false
   }

   method misilesDesplegados()= misilesDesplegados

   method emitirMensaje(mensaje){
      mensajesEmitidos.add(mensaje)
   }

   method primerMensajeEmitido()= mensajesEmitidos.first()
   method ultimoMensajeEmitido()=mensajesEmitidos.last()
   method esEscueta()=!mensajesEmitidos.any({unMensaje=>unMensaje.lenght()>=30})
   method emitioMensaje(mensaje)=mensajesEmitidos.mensaje

   override method prepararViaje(){
    self.ponerseVisible()
    self.replegarMisiles()
    self.acelerar(15000)
    self.emitioMensaje("Saliendo en mision")
   }
}