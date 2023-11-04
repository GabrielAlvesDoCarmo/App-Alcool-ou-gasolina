//
//  HomeViewController.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 03/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    var screen : HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension HomeViewController : HomeScreenDelegate {
    func clickStartBtn() {
        let calculator = CalculatorViewController()
        navigationController?.pushViewController(calculator, animated: false)
    }
}
