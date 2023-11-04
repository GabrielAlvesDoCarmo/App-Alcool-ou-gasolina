//
//  UITextFieldExtensions.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 04/11/23.
//

import Foundation
import UIKit

extension UITextField {
    func closeKeyboard(){
        let doneToolbar : UIToolbar = UIToolbar(
            frame: CGRect.init(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: 50
            )
        )
        doneToolbar.barStyle = .default
        let flexSpacing = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let done  = UIBarButtonItem(
            title: "OK",
            style: .done,
            target: self,
            action:#selector(clickDoneKeyboard)
        )
        
        let items = [flexSpacing,done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.inputAccessoryView = doneToolbar
    }
    @objc func clickDoneKeyboard(){
        self.resignFirstResponder()
    }
}
