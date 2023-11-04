//
//  ResultScreen.swift
//  Alcool ou gasoline
//
//  Created by Gabriel Alves on 04/11/23.
//

import UIKit

class ResultScreen: UIView {
    private weak var delegate : ResultScreenDelegate?
    
    public func delegate(delegate : ResultScreenDelegate){
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
    
    lazy var btnBack : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Botão Back"),for: .normal)
        btn.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return btn
    }()
    
    lazy var sentenceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 31)
        label.text = "Abastaça com:"
        return label
    }()
    
    
    lazy var resultLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 73)
        label.text = "Gasolina"
        return label
    }()
    
    lazy var reculculateButton : UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Calcular novamente", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18,weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        btn.addTarget(self, action: #selector(clickCalculateButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func clickCalculateButton(){
        delegate?.restarCalculate()
    }
    
    @objc func clickBack() {
        delegate?.clickBack()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        addSubview(logoAppImageView)
        addSubview(sentenceLabel)
        addSubview(reculculateButton)
        addSubview(resultLabel)
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
            // MARK: logo app image viewt
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoAppImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            //MARK: btn back
            btnBack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            btnBack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            //MARK: sentencelabel
            sentenceLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 180),
            sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            // MARK: result label
            resultLabel.topAnchor.constraint(equalTo: sentenceLabel.bottomAnchor, constant: 12),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //MARK: btn recalcular
            reculculateButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 80),
            reculculateButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -80),
            reculculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            reculculateButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
