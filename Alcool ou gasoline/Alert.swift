//
//  Alert.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 04/11/23.
//

import UIKit

class Alert {
    let controller : UIViewController
    
    init(controller : UIViewController) {
        self.controller = controller
    }
    
    func showAlertInformation(
        title : String,
        msg : String
    ){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(okButton)
        controller.present(alertController, animated: true)
    }

}
