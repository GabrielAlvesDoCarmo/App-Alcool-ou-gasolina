//
//  ResultViewController.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 04/11/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var screen : ResultScreen?
    var result : ResultEnum?
    
    init(result : ResultEnum){
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = result?.rawValue
    }
    
    func popViewController(){
        navigationController?.popViewController(animated: true)
    }

}
