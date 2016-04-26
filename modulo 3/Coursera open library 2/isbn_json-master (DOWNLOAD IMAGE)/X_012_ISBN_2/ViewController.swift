//
//  ViewController.swift
//  X_012_ISBN_2
//
//  Created by Alejandro Cárdenas Cienfuegos on 3/20/16.
//  Copyright © 2016 ULocate, S.A. de C.V. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isbn: UITextField!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var autores: UITextField!
    @IBOutlet weak var titulo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isbn.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showErrorAlertMessage(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        //clearFields()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        self.isbn.resignFirstResponder()
        self.imageView.image = nil
        getISBNInfo(isbn.text!)
        return true
    }

    func getISBNInfo( isbn: NSString){
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + (isbn as String)
        let url = NSURL(string: urls)
        let session = NSURLSession.sharedSession()
        let bloque = { (datos: NSData?, resp : NSURLResponse?, error: NSError?) -> Void in
            
            if((error) != nil)
            {
                let alertController = UIAlertController(title: "ISBN Information", message:
                    error?.description, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else
            {
                do
                {
                    let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                    let key = "ISBN:" + self.isbn.text!
                    let dico1 = json as! NSDictionary
                    let dico2 = dico1[key] as! NSDictionary
                    let title = dico2["title"] as! NSString as String
                    
                    let authors = dico2["authors"] as? [[String: AnyObject]]
                    
                    var authorsNames: String = ""
                    for author  in authors!
                    {
                        if let name = author["name"] as? String
                        {
                            // Do stuff with data
                            if ( authorsNames != "" )
                            {
                                authorsNames = authorsNames + ","
                            }
                             authorsNames = authorsNames + (name)
                        }
                    }
                    
                    if let covers1 = dico2["cover"]
                    {
                        let covers = covers1 as! NSDictionary
                        let cover = covers["medium"] as! NSString as String
                        if let checkedUrl = NSURL(string: cover) {
                            //self.imageView.contentMode = .ScaleAspectFit
                            self.downloadImage(checkedUrl)
                        }
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        // code here
                        //self.resultsTextView.text = (texto as! String)
                        self.titulo.text = title
                        self.autores.text = authorsNames
                    })
                    
                }
                catch _{
                
                }
                
                
            }
            
            //print(texto!)
        }
        let dt = session.dataTaskWithURL(url!, completionHandler: bloque)
        dt.resume()
        
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func downloadImage(url: NSURL){
            getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    
}

