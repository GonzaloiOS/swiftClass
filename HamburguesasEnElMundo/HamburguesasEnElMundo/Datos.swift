//
//  Datos.swift
//  HamburguesasEnElMundo
//
//  Created by Gonzalo on 27/01/16.
//  Copyright © 2016 G. All rights reserved.
//

import Foundation
import UIKit

class ColeccionDePaises{
    
    let paises : [String] = ["Colombia","México","España","Argentina","Alemania","Japón","Brasil","Bélgica","Estados Unidos","China","Inglaterra","Ecuador","Francia","Rusia","Chile","Panama","Grecia","Italia","Escocia","Suiza"]
    
    func obtenPais()->String{
        
        let position = arc4random() % UInt32(paises.count)
        return paises[Int(position)]
    }
}

class ColeccionDeHamburguesas{
    
    let hamburguesa : [String] = ["Italiana","Mexicana","Angus","Criolla","Costeña","Era gol de Yepes","Pollo","Carne","Pescado","Vegetariana","Texana","Todo Terreno","Mixta","Alemana","Mediterranea","Triple Queso","Sencilla","Queso Azul","Tres Quesos","Lucia"]
    
    func obtenHamburguesa()->String{
        
        let position = arc4random() % UInt32(hamburguesa.count)
        return hamburguesa[Int(position)]
    }
}

class Colores{
    
    func obtenColor()->UIColor{
        
        let randomRed = (Float(arc4random()) % 255)/255
        let randomBlue = (Float(arc4random()) % 255)/255
        let randomGreen = (Float(arc4random()) % 255)/255
        
        return UIColor(red: CGFloat(randomRed), green: CGFloat(randomGreen), blue: CGFloat(randomBlue), alpha: 1)
    }
}