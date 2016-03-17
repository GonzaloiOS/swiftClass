//
//  ViewController.swift
//  ConsultaSwift
//
//  Created by Gonzalo on 17/03/16.
//  Copyright © 2016 G. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultTextView: UITextView!
    
    @IBOutlet weak var searchBookTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Delegate
        self.searchBookTextField.delegate = self
        self.resultTextView.userInteractionEnabled = false
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //When user tap search in keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.activityIndicator.startAnimating()
        
        print(textField.text!)
        
        self .searchInOpenLibrary(textField.text!)
        
        textField.resignFirstResponder()
        return true;
    }
    //async
    func searchInOpenLibrary (text:String) {
        
        //var urlString = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:978-84-376-0494-7"
        
        var urlString = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        
        urlString += text
        
        let url = NSURL (string: urlString)
        let session = NSURLSession.sharedSession()
        /*let block = {(data:NSData?, resp: NSURLResponse?, error:NSError?) -> Void in
            
            let rawResponse = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(rawResponse)
            
        }*/
        
        let task = session.dataTaskWithURL(url!) { (data:NSData?, resp:NSURLResponse?, error:NSError?) -> Void in
            
            //nill means no error
            
            var responseToShow:String = ""
            
            if((error) != nil){
                
                responseToShow = "Error en la consulta, revisa tu conexión a internet";
                
            }else{
                
                let rawResponse:String? = String(data: data!, encoding: NSUTF8StringEncoding)
                
                responseToShow = "Resultado de la búsqueda: " + rawResponse!
            }
            
            dispatch_async(dispatch_get_main_queue(),{
                //show result
                self.activityIndicator.stopAnimating()
                self.resultTextView.text = responseToShow
            })
            
        }
        
        task.resume()
    }

}

