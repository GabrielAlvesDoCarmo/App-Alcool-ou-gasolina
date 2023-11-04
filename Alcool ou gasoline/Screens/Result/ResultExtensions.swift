//
//  ResultExtensions.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 04/11/23.
//

import Foundation

extension ResultViewController : ResultScreenDelegate {
    func clickBack() {
        popViewController()
    }
    
    func restarCalculate() {
       popViewController()
    }
}
