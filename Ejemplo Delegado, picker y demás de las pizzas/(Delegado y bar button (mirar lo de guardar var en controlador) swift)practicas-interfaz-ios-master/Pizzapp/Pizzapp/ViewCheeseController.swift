//
//  ViewCheeseController.swift
//  Pizzapp
//
//  Created by Pollinion User on 04/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import UIKit

protocol AcceptDataFromCheeseVC {
    func acceptDataFromCheese (data:String)
}

class ViewCheeseController: UIViewController {

    var delegate:AcceptDataFromCheeseVC?

    var cheese:String = ""
    
    @IBOutlet weak var label_cheese: UILabel!
    
    @IBAction func mozarela(sender: AnyObject) {
        self.load_shape("Mozarela")
    }
    @IBAction func Cheddar(sender: AnyObject) {
        self.load_shape("Chedar")
    }
    @IBAction func parmesano(sender: AnyObject) {
        self.load_shape("Parmesano")
    }
    @IBAction func noCheese(sender: AnyObject) {
        self.load_shape("Sin Queso")
    }
    
    func load_shape( shapeName:String)
    {
        self.cheese = shapeName
        self.label_cheese.text = "Tipo " + self.cheese
    }
    
    override func viewWillDisappear(animated: Bool) {
        delegate?.acceptDataFromCheese(self.cheese)
    }
    override func viewWillAppear(animated: Bool) {
        if self.cheese != ""
        {
            self.load_shape(self.cheese)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
