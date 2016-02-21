//
//  ViewMasaController.swift
//  ordenaPizza
//
//  Created by Juan  Sanchez on 12/1/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit

class ViewMasaController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var lst_masa: UIPickerView!
    

    
    var Pizza = OrdenPizza()

    
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguiente = segue.destinationViewController as! ViewQuesoController
        siguiente.Pizza.masa = Pizza.masa
        siguiente.Pizza.tamano = Pizza.tamano
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // returns the # of rows in each component..
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return lista_masas.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Pizza.masa = lista_masas[row]
        Pizza.imprimir()
        return lista_masas[row]
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
