//
//  ViewShapeController.swift
//  Pizzapp
//
//  Created by Pollinion User on 04/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import UIKit

// protocol used for sending data back

protocol AcceptDataFromShapeVC {
    func acceptDataFromShape (data:String)
}

class ViewShapeController: UIViewController {
   
    var delegate:AcceptDataFromShapeVC?

    var shape:String = ""
    
    @IBOutlet weak var label_shape: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func big_shape(sender: AnyObject) {
        self.load_shape("grande")
    }
    @IBAction func medium_shape(sender: AnyObject) {
        self.load_shape("mediana")
    }
    @IBAction func small_shape(sender: AnyObject) {
        self.load_shape("chica")
    }
    
    func load_shape( shapeName:String)
    {
        self.shape = shapeName
        self.label_shape.text = "Tamaño " + self.shape
    }
    
    override func viewWillDisappear(animated: Bool) {
        delegate?.acceptDataFromShape(self.shape)
    }
    
    override func viewWillAppear(animated: Bool) {
        if self.shape != ""
        {
            self.load_shape(self.shape)
        }
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
