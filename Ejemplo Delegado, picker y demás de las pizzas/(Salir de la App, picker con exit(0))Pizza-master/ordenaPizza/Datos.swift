//
//  Datos.swift
//  ordenaPizza
//
//  Created by Juan  Sanchez on 5/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import Foundation

let lista_masas = ["Delgada", "Crujiente", "Gruesa"]

let lista_tamano = ["Chica", "Mediana", "Grande"]

let lista_queso = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]


class OrdenPizza {
    var masa : String
    var tamano : String
    var queso : String
    var cantidadIngredientes : Int
    var jamon : String
    var peperoni: String
    var pavo: String
    var salchicha: String
    var aceituna: String
    var cebolla: String
    var pimiento: String
    var piña: String
    var anchoa: String
    
    init () {
        self.masa = ""
        self.queso = ""
        self.tamano = ""
        self.cantidadIngredientes = 0
        self.jamon = "N"
        self.peperoni = "N"
        self.pavo = "N"
        self.salchicha = "N"
        self.aceituna = "N"
        self.cebolla = "N"
        self.pimiento = "N"
        self.piña = "N"
        self.anchoa = "N"
    }
    
    func ingredientes() ->String{
        var resultado : String = ""
        if self.jamon == "S" {
            resultado = resultado + "   Jamon \n"
        }
        if self.peperoni == "S" {
            resultado = resultado + "   Peperoni \n"
        }
        if self.pavo == "S" {
            resultado = resultado + "   Pavo \n"
        }
        if self.salchicha == "S" {
            resultado = resultado + "  Salchicha \n"
        }
        if self.aceituna == "S" {
            resultado = resultado + "  Aceituna \n"
        }
        if self.cebolla == "S" {
            resultado = resultado + "  Cebolla \n"
        }
        if self.pimiento == "S" {
            resultado = resultado + "   Pimiento \n"
        }
        if self.piña == "S" {
            resultado = resultado + "   Piña \n"
        }
        if self.anchoa == "S" {
            resultado = resultado + "  Anchoa \n"
        }
        
        return resultado

    }
    
    func borrarIngredientes() ->Void{
        self.cantidadIngredientes = 0
        self.jamon = "N"
        self.peperoni = "N"
        self.pavo = "N"
        self.salchicha = "N"
        self.aceituna = "N"
        self.cebolla = "N"
        self.pimiento = "N"
        self.piña = "N"
        self.anchoa = "N"
    }
    
    func imprimir() ->Void{
        let resultado =  self.ingredientes()
        print("cantidad = \(self.cantidadIngredientes)")
        print("masa: \(self.masa), queso:\(self.queso), tamaño:\(self.tamano)"  )
        print("ingredientes : \(resultado)")
    }
    
}









