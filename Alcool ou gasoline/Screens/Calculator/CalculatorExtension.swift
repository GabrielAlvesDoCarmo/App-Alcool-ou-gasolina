//
//  CalculatorExtension.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 04/11/23.
//

import Foundation
import UIKit

extension CalculatorViewController : CalculatorDelegate {
    func clickCalculate() {
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            let alcoolPrice : Double = (formatter.number(from: screen?.textFieldAlcool.text ?? "0.0") as? Double) ?? 0.0
            let gasolinePrice : Double = (formatter.number(from: screen?.textFieldGasoline.text ?? "0.0") as? Double) ?? 0.0
            
            let resultScreen : ResultViewController?
            if alcoolPrice / gasolinePrice > 0.7 {
                resultScreen = ResultViewController(result: .gas)
            }else{
                resultScreen = ResultViewController(result: .alcool)
            }
            navigationController?.pushViewController(resultScreen ?? UIViewController(), animated: false)
        }

    }
    
    func clickBack() {
        navigationController?.popViewController(animated: true)
    }
}
