//
//  CalculatorViewController.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 03/11/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var screen : CalculatorScreen?
    var alert : Alert?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func validateTextFields() -> Bool {
        guard let alcoolPrice = screen?.textFieldAlcool.text else {return false}
        guard let gasPrice = screen?.textFieldGasoline.text else {return false}
        
        if alcoolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atencao ", msg: "Informe os valores de alcool e gasolina")
            return false
        }else if  alcoolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atencao ", msg: "Informe o valor do alcool")
            return false
        }else if  gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atencao ", msg: "Informe o valor da Gasoline")
            return false
        }
        
        return true
    }
}

