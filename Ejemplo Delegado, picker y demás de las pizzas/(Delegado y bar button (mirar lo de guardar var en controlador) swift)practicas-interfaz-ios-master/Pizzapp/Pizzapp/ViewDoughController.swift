//
//  ViewDoughController.swift
//  Pizzapp
//
//  Created by Pollinion User on 04/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import UIKit

protocol AcceptDataFromDoughVC {
    func acceptDataFromDough (data:String)
}

class ViewDoughController: UIViewController {

    var delegate:AcceptDataFromDoughVC?
    var dough:String = ""
    
    @IBOutlet weak var label_dough: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func slim_dough(sender: AnyObject) {
        self.load_shape("delgada")
    }
    
    @IBAction func crunchy_dough(sender: AnyObject) {
        self.load_shape("Crujiente")
    }
    @IBAction func gross_dough(sender: AnyObject) {
        self.load_shape("Gruesa")
    }
    
    override func viewWillDisappear(animated: Bool) {
        delegate?.acceptDataFromDough(self.dough)
    }
    override func viewWillAppear(animated: Bool) {
        if self.dough != ""
        {
            self.load_shape(self.dough)
        }
    }
    
    func load_shape( shapeName:String)
    {
        self.dough = shapeName
        self.label_dough.text = "Masa " + self.dough
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
