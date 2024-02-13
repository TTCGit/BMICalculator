//
//  Controller.swift
//  BMI Calculator
//
//  Created by Tiberiu Tasca on 12.02.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct Controller {
    var bmi: BMI?
    
    func getBmi() -> String {
        let bmi = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmi
    }
    
    func getAdive() -> String {
        let advice = bmi?.advice ?? "No advice"
        return advice
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBmi (height: Float, weight: Float) {
        let bmiValue = weight / (pow(height, 2))
        let minWeightSkinny = String(format: "%.2f", (18.5 * pow(height, 2)) - weight)
        let minWeightFat = String(format: "%.1f", weight - (24.9 * pow(height, 2)))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Mai traba sa mananci. Mai pune si tu \(minWeightSkinny)kg", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Ii forte bine", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Aoloe. Da jos macar \(minWeightFat)kg", color: UIColor.red)
        }
    }
}
