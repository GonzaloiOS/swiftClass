//
//  Datos.swift
//  ISBN
//
//  Created by Jorge Andres Moreno Castiblanco on 11/03/16.
//  Copyright © 2016 eworld. All rights reserved.
//

import Foundation

class Libro{
    
    func conexionResFul(isbn:String)->String{
        
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn)"
        
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        
        if(datos != nil){
            let texto = NSString(data:datos!, encoding: NSUTF8StringEncoding)
           return texto! as String
        }
        
            return "error"
        
        
    }

    
}
