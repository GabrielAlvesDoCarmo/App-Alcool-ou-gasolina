//
//  UIViewControllerExtensions.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 04/11/23.
//

import Foundation
import UIKit


extension UIViewController {
    
    
    func hideKeyboard(){
        let click = UIGestureRecognizer(target: self, action: #selector(clickHideKeyboard))
        click.cancelsTouchesInView = false
        view.addGestureRecognizer(click)
    }
    
    @objc func clickHideKeyboard(){
        view.endEditing(true)
    }
}
