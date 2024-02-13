//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var controller = Controller()
    
    @IBAction func heightSliderValue(_ sender: UISlider) {
        let heightOnChange = String(format: "%.2f", sender.value)
        heightLabel.text = heightOnChange
    }
    
    @IBAction func weightSliderValue(_ sender: UISlider) {
        let weightOnChange = String(format: "%.2f", sender.value)
        weightLabel.text = weightOnChange
    }
    
    @IBAction func calculate(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        controller.calculateBmi(height: height, weight: weight)
        
        performSegue(withIdentifier: "passValue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "passValue") {
            let results = segue.destination as! ResultsViewController
            results.bmiValue = controller.getBmi()
            results.advice = controller.getAdive()
            results.color = controller.getColor()
        }
    }

}

