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
    @IBOutlet weak var urlImagen: UILabel!
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
        var temp = ("","","")
        isbnTemp = isbnIN.text!
        temp = isbn.conexionResFul(isbnTemp)
        if(temp.0 == "error" && temp.1 == "error" ){
            let alerta = UIAlertController(title: "Error", message: "Error en la conexión", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            presentViewController(alerta, animated: true, completion: nil)
            isbnIN.resignFirstResponder()
        }else if(temp.0 == "{}"){
            let alerta = UIAlertController(title: "Error", message: "No encontro el libro", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            presentViewController(alerta, animated: true, completion: nil)
            isbnIN.resignFirstResponder()
        }else{
            var titulo = ("Título: ","","  Autores: ","")
            titulo.1 = temp.0
            titulo.3 = temp.1
            textos.text = titulo.0 + titulo.1 + titulo.2 + titulo.3
            urlImagen.text = temp.2
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

