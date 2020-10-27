//
//  TextFieldContainer.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

class TextFieldContainer: GenericBaseView<TextFieldContainerData> {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = ColorSpectrum.defaultWhite
        temp.layer.shadowColor = ColorSpectrum.darkTheme.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 4)
        temp.layer.shadowRadius = 4
        temp.layer.opacity = 0.6
        temp.layer.cornerRadius = 10
        return temp
    }()

    lazy var textField: UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        temp.font = SourceSansPro.SemiBold(16).value
        temp.backgroundColor = ColorSpectrum.defaultWhite
        temp.keyboardType = .alphabet
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addUserInterfaceComponents()
    }
    
    private func addUserInterfaceComponents() {
        addSubview(containerView)
        containerView.addSubview(textField)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            textField.topAnchor.constraint(equalTo: containerView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        textField.placeholder = data.placeHolder
        textField.textColor = data.titleTextColor
    }
    
}

