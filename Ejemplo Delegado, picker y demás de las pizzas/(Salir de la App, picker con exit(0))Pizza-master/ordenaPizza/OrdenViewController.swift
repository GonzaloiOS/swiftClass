//
//  OrdenViewController.swift
//  ordenaPizza
//
//  Created by Juan  Sanchez on 7/2/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit

class OrdenViewController: UIViewController {

    
    var Pizza = OrdenPizza()
    
    
    @IBOutlet weak var orden: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if Pizza.cantidadIngredientes == 0  {
            
            orden.text =  "Debe seleccionar al menos un ingrediente"
            
        } else if Pizza.cantidadIngredientes > 5 {
            
            orden.text =  "Maximo numero de ingredientes 5, regrese y reduzca la cantidad"
            
        } else {
            
             orden.text = "Tamaño : \(Pizza.tamano) \n Masa : \(Pizza.masa) \n Queso : \(Pizza.queso) Ingredientes :\(Pizza.ingredientes())"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
