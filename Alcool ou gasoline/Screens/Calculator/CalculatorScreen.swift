//
//  CalculatorScreen.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 03/11/23.
//

import UIKit
class CalculatorScreen: UIView {
    private weak var delegate : CalculatorDelegate?
    
    public func delegate(delegate : CalculatorDelegate){
        self.delegate = delegate
    }
    
    lazy var bgImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUE DARK")
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
    
    lazy var btnCalculate : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18,weight: .black)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(clickCalculate), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        return button
    }()
    
    lazy var textFieldGasoline : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        field.keyboardType = .decimalPad
        field.placeholder = "Preco da gasoline"
        field.textColor = .darkGray
        field.clickDoneKeyboard()
        return field
    }()
    
    lazy var textFieldAlcool : UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.backgroundColor = .white
        field.borderStyle = .roundedRect
        field.keyboardType = .decimalPad
        field.placeholder = "Preco da alcool"
        field.textColor = .darkGray
        field.clickDoneKeyboard()
        return field
    }()
    lazy var btnBack : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Botão Back"),for: .normal)
        btn.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return btn
    }()
    
    @objc func clickCalculate(){
        delegate?.clickCalculate()
    }
    
    @objc func clickBack(){
        delegate?.clickBack()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        addSubview(logoAppImageView)
        addSubview(textFieldGasoline)
        addSubview(textFieldAlcool)
        addSubview(btnCalculate)
        addSubview(btnBack)
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
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoAppImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //MARK: btn calcular
            btnCalculate.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
            btnCalculate.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -80),
            btnCalculate.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            btnCalculate.heightAnchor.constraint(equalToConstant: 44),
            //MARK: textfield gasoline
            textFieldGasoline.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 200),
            textFieldGasoline.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldGasoline.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textFieldGasoline.heightAnchor.constraint(equalToConstant: 45),
            //MARK: textfield alcool
            textFieldAlcool.topAnchor.constraint(equalTo: textFieldGasoline.bottomAnchor, constant: 16),
            textFieldAlcool.leadingAnchor.constraint(equalTo: textFieldGasoline.leadingAnchor),
            textFieldAlcool.trailingAnchor.constraint(equalTo: textFieldGasoline.trailingAnchor),
            textFieldAlcool.heightAnchor.constraint(equalTo: textFieldGasoline.heightAnchor),
            //MARK: btn back
            btnBack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            btnBack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
}
