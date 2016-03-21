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
    
    
    @IBOutlet weak var titleBookTextView: UITextView!
    
    @IBOutlet weak var authorTextView: UITextView!
    
    
    @IBOutlet weak var portraitTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Delegate
        
        self.searchBookTextField.delegate = self
        self.resultTextView.userInteractionEnabled = false
        //self.resultTextView.hidden = true
        
        self.titleBookTextView.userInteractionEnabled = false
        self.authorTextView.userInteractionEnabled = false
        self.portraitTextView.editable = false
        
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
            var titleBook:String = ""
            var portraitBook:String = ""
            var authorName:String = ""
            
            
            if((error) != nil){
                
                responseToShow = "Error en la consulta, revisa tu conexión a internet";
                
            }else{
                
                let rawResponse:String? = String(data: data!, encoding: NSUTF8StringEncoding)
                
                responseToShow = "Resultado de la búsqueda: " + rawResponse!
                
                if(!(rawResponse! == "{}")){
                    
                    //processing JSON, I have to uwe tray and catch
                    
                    do{
                        
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves)
                        
                        let jsonDictionary = json as! NSDictionary
                        
                        //let isbnDictionary = jsonDictionary["ISBN:978-84-376-0494-7"] as! NSDictionary
                        let isbnDictionary = jsonDictionary["ISBN:"+text] as! NSDictionary
                        
                        titleBook = isbnDictionary["title"] as! NSString as String
                        
                        portraitBook = isbnDictionary["url"] as! NSString as String
                        
                        let authorsArray = isbnDictionary["authors"] as! NSArray
                        
                        //authorName = subjectPeopleDictionary["name"] as! NSString as String
                        let authorsDictionary = authorsArray[0] as! NSDictionary
                        
                        authorName = authorsDictionary["name"] as! NSString as String
                        
                    }catch _{
                        
                    }
                }
            }
            
            dispatch_async(dispatch_get_main_queue(),{
                //show result
                self.activityIndicator.stopAnimating()
                self.resultTextView.text = responseToShow
                
                self.titleBookTextView.text = titleBook
                self.authorTextView.text = authorName
                self.portraitTextView.text = portraitBook
            })
            
        }
        
        task.resume()
    }

}

