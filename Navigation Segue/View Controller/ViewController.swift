//
//  ViewController.swift
//  Navigation Segue
//
//  Created by Denis Bystruev on 20/06/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var `switch`: UISwitch!
    
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard `switch` != nil else { return }
        `switch`.isOn = isOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            
        case "YellowSegue":
            segue.destination.navigationItem.title = textField.text
            
        case "GreenSegue":
            let destination = segue.destination as! ViewController
            destination.isOn = isOn
            
        default:
            break
            
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "UnwindSegue" else { return }
        guard let source = segue.source as? ViewController else { return }
        
        isOn = source.`switch`.isOn
        title = isOn ? "Включено" : "Выключено"
    }
}

