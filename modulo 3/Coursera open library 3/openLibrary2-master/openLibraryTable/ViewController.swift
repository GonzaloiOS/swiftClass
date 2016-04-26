//
//  ViewController.swift
//  openlibrary
//
//  Created by Jorge Cozain on 05/03/16.
//  Copyright © 2016 Jorge Cozain. All rights reserved.
//
import UIKit

enum DataError: ErrorType{
    case ISBN_Not_Found
}

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var book: Book?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        self.textField.delegate = self
        if book != nil{
            self.displayInfo(self.book!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        self.titleLabel.text = nil
        self.authorsLabel.text = nil
        self.imageView.image = nil
        
        let updateTextView = {(data:NSData?, error:NSError?) -> Void in
            
            guard error == nil else {
                self.displayAlert("Error", message: error!.localizedDescription)
                return
            }
            
            do{
                //If there is no info for the ISBN then throw an exception.
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves)
                let root = json as! NSDictionary
                let key = "ISBN:\(self.textField.text!)"
                guard root.objectForKey(key) != nil else {throw DataError.ISBN_Not_Found}
                let mainDic = root[key] as! NSDictionary
                
                //Store the title.
                let title = mainDic["title"] as! NSString as String
                
                //Store all authors' names in an array
                let authorsDic = mainDic["authors"] as! NSArray as Array
                var authorsArray: Array<String> = Array<String>()
                for author in authorsDic{
                    let authorString = author["name"] as! NSString as String
                    authorsArray.append(authorString)
                }
                
                //If there is cover information then update the image view.
                var image: UIImage?
                if (mainDic.objectForKey("cover") != nil){
                    let coversDic = mainDic["cover"] as! NSDictionary
                    let imageUrls = coversDic["large"] as! NSString as String
                    let imageData = NSData(contentsOfURL: NSURL(string: imageUrls)!)
                    image = UIImage(data: imageData!)
                }
                
                self.book = Book(title: title, ISBN: self.textField.text!, authors: authorsArray.joinWithSeparator(", "), image: image)
                books.append(self.book!)
                
                //Make changes to the UI in the main thread.
                self.displayInfo(self.book!)
            }
            catch DataError.ISBN_Not_Found {
                self.displayAlert("", message: "ISBN: \(self.textField.text!) not found.")
            }
            catch _ {
                self.displayAlert("", message: "Unkown error.")
            }
            
            
        }
        bookInformation(textField.text!, completion: updateTextView)
        
        return true
    }
    
    
    func displayInfo(book: Book)->Void{
        
        //Make changes to the UI in the main thread.
        dispatch_async(dispatch_get_main_queue(), {
            self.titleLabel.text = "Title: " + self.book!.title
            self.authorsLabel.text = "Authors: " + self.book!.authors
            self.imageView.image = self.book!.image
        })
    }
    
    func displayAlert(title: String, message:String)->Void{
        dispatch_async(dispatch_get_main_queue(), {
            let alert = UIAlertController(title: title , message: message, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        })
    }
    
}

