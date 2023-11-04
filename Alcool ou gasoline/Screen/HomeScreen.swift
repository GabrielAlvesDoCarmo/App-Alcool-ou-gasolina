//
//  HomeScreen.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 03/11/23.
//

import UIKit

protocol HomeScreenDelegate : AnyObject {
    func clickStartBtn()
}

class HomeScreen: UIView {
    private weak var delegate : HomeScreenDelegate?
    
    public func delegate(delegate : HomeScreenDelegate){
        self.delegate = delegate
    }
    
    lazy var bgImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG HOME")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoAppImageView : UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "LOGO")
        logoImage.contentMode = .scaleAspectFit
        return logoImage
    }()
    
    lazy var btnComecar : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Comecar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18,weight: .black)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(clickStartButton), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        return button
    }()
    
    @objc func clickStartButton(){
        delegate?.clickStartBtn()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        addSubview(logoAppImageView)
        addSubview(btnComecar)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            // MARK: bg image view
            bgImageView.topAnchor.constraint(equalTo: topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            // MARK: logo app image view
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 104),
            logoAppImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //MARK: btn comecar
            btnComecar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
            btnComecar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -80),
            btnComecar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            btnComecar.heightAnchor.constraint(equalToConstant: 44)
           
        ])
    }
}
