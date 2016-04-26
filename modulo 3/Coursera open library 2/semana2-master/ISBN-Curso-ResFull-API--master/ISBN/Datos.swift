//
//  Datos.swift
//  ISBN
//
//  Created by Jorge Andres Moreno Castiblanco on 11/03/16.
//  Copyright © 2016 eworld. All rights reserved.
//

import Foundation

class Libro{
    
    func conexionResFul(isbn:String)->(String, String, String){
        
        
        let url = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        
        let urls = NSURL(string: url + isbn)
        let datos = NSData(contentsOfURL: urls!)
        
        if(datos != nil){
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = json as! NSDictionary
                let dico2 = dico1["ISBN:\(isbn)"] as! NSDictionary
                let dicoTitulo = dico2["title"] as! NSString as String
                let dicoAutores = dico2["authors"] as? [[String: AnyObject]]
                var nombresAutores:String = ""
                
                for autor in dicoAutores!{
                    if let nombre = autor["name"] as? String {
                        if(nombresAutores != ""){
                            nombresAutores = nombresAutores + ","
                        }
                        nombresAutores = nombresAutores + (nombre)
                    }
                }
                if let dicoPortada1 = dico2["cover"]{
                    let dicoPortada2 = dicoPortada1 as! NSDictionary
                    let dicoPortada3 = dicoPortada2["medium"] as! NSString as String
                    return (dicoTitulo,nombresAutores,dicoPortada3)
                }
                return (dicoTitulo,nombresAutores,"No hay portada")
            }
            catch _{
                print("ocurrio un error")
            }
        }
        
            return ("error", "error", "error")
        
        
    }

    
}
