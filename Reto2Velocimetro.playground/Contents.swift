//: Reto 2, por Gonzalo Linares Navarro

import UIKit

//Creando enum

enum Velocidades : Int {
    
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init(velocidadInicial: Velocidades){//init del enum puesto en self
        
        self = velocidadInicial
    }
}

//creando clase
class Auto {
    
    var velocidad : Velocidades
    
    init (){ //init de la clase que hace init en el enum
        
        self.velocidad = Velocidades(velocidadInicial: .Apagado)
    }
    
    func cambioDeVelocidad ( ) -> (actual:Int, velocidadEnCadena:String){
        
        let tuplaResponse :(Int,String) = (velocidad.rawValue,String(velocidad))//también podría evaluar cada caso y enviar un String de velocidad diferente
        
        switch velocidad{
            
            case .Apagado:
                
                velocidad = .VelocidadBaja
                return tuplaResponse
            
            case .VelocidadBaja:
            
                velocidad = .VelocidadMedia
                return tuplaResponse
            
            case .VelocidadMedia:
                velocidad = .VelocidadAlta
                return tuplaResponse
            
            case .VelocidadAlta:
                velocidad = .VelocidadMedia
            
            return tuplaResponse
            
        }
    }
}

//Llamado clase
var auto = Auto()

//itera

for count in 0...20 {
    
    let tuplaDeRespuesta = auto.cambioDeVelocidad()
    
    print("\(tuplaDeRespuesta.actual),"+tuplaDeRespuesta.velocidadEnCadena)
}
