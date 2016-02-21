//
//  ViewSelectController.swift
//  Pizzapp
//
//  Created by Pollinion User on 06/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import UIKit


class ViewSelectController: UIViewController {

    
    var shape:String = ""
    var dough:String = ""
    var cheese:String = ""
    var ingredients = [String]()
    
    @IBOutlet weak var pedido: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pedido.numberOfLines = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        var show_ingredients:String = "Tamaño: \(self.shape)\n"
        show_ingredients += "Masa: \(self.dough)\n"
        show_ingredients += "Queso: \(self.cheese)\n"
        show_ingredients += "Ingredientes:\n"
        for ingredient in self.ingredients {
            show_ingredients += "    \(ingredient) \n"
        }
        self.pedido.text = show_ingredients

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
