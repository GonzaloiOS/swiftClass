//
//  ViewController.swift
//  HamburguesasEnElMundo
//
//  Created by Gonzalo on 26/01/16.
//  Copyright © 2016 G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var hamburguerNameLabel: UILabel!
    
    var pais = ColeccionDePaises()
    var hamburguesa = ColeccionDeHamburguesas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func iWannaHamburgerButton(sender: AnyObject) {
        
        countryNameLabel.text = pais.obtenPais()
        hamburguerNameLabel.text = hamburguesa.obtenHamburguesa()
        let color = Colores()
        view.backgroundColor = color.obtenColor()
        view.tintColor = color.obtenColor()
    }

}

