//
//  IngredientesController.swift
//  ordenaPizza
//
//  Created by Juan  Sanchez on 7/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit

class IngredientesController: UIViewController {

    
    @IBOutlet weak var conJamon: UISwitch!
    
    @IBOutlet weak var conPeperoni: UISwitch!
    
    @IBOutlet weak var conPavo: UISwitch!
    
    @IBOutlet weak var conSalchicha: UISwitch!
    
    @IBOutlet weak var conAceituna: UISwitch!
    
    @IBOutlet weak var conCebolla: UISwitch!
    
    @IBOutlet weak var conPimiento: UISwitch!
    
    @IBOutlet weak var conPiña: UISwitch!
    
    @IBOutlet weak var conAnchoas: UISwitch!
    
    
    var Pizza = OrdenPizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguiente = segue.destinationViewController as! OrdenViewController
        siguiente.Pizza = Pizza
        //siguiente.Pizza.tamano = Pizza.tamano
        //siguiente.Pizza.queso = Pizza.queso
    }

    
    @IBAction func Confirmar(sender: AnyObject) {
        
        Pizza.borrarIngredientes()
        if (conJamon.on) {
            Pizza.jamon = "S"
            Pizza.cantidadIngredientes++
        }
        if (conPeperoni.on) {
            Pizza.peperoni = "S"
            Pizza.cantidadIngredientes++
        }
        if (conPavo.on) {
            Pizza.pavo = "S"
            Pizza.cantidadIngredientes++
        }
        if (conSalchicha.on) {
            Pizza.salchicha = "S"
            Pizza.cantidadIngredientes++
        }
        if (conAceituna.on) {
            Pizza.aceituna = "S"
            Pizza.cantidadIngredientes++
        }
        if (conCebolla.on) {
            Pizza.cebolla = "S"
            Pizza.cantidadIngredientes++
        }
        if (conPimiento.on) {
            Pizza.pimiento = "S"
            Pizza.cantidadIngredientes++
        }
        if (conPiña.on) {
            Pizza.piña = "S"
            Pizza.cantidadIngredientes++
        }
        if (conAnchoas.on) {
            Pizza.anchoa = "S"
            Pizza.cantidadIngredientes++
        }
        
        
        Pizza.imprimir()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
