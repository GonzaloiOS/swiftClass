//
//  ViewController.swift
//  ISBN
//
//  Created by Jorge Andres Moreno Castiblanco on 11/03/16.
//  Copyright © 2016 eworld. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var isbn = Libro()
    @IBOutlet weak var isbnIN: UITextField!
    @IBOutlet weak var textos: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isbnIN.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var isbnTemp = ""
        var temp = ""
        isbnTemp = isbnIN.text!
        temp = isbn.conexionResFul(isbnTemp)
        if(temp == "error"){
            let alerta = UIAlertController(title: "Error", message: "Error en la conexión", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            presentViewController(alerta, animated: true, completion: nil)
            isbnIN.resignFirstResponder()
        }else if(temp == "{}"){
            let alerta = UIAlertController(title: "Error", message: "No encontro el libro", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            presentViewController(alerta, animated: true, completion: nil)
            isbnIN.resignFirstResponder()
        }else{
            textos.text = isbn.conexionResFul(isbnTemp)
            isbnIN.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("borrado")
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        isbnIN.resignFirstResponder()
        print("finaliza edicion")
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("empezando a editar")
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("editando")
    }
    

}

