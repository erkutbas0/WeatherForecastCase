//
//  FilterViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class FilterViewComponent: GenericBaseView<FilterViewComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [cityText, dailyCount])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var cityText: UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.placeholder = CitySearchViewLocalizables.cityPlaceHolder.value
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        temp.font = SourceSansPro.SemiBold(16).value
        temp.textColor = ColorSpectrum.darkTheme
        temp.backgroundColor = ColorSpectrum.defaultWhite
        temp.layer.cornerRadius = 10
        temp.placeholderRect(forBounds: CGRect(x: 50, y: 0, width: 0, height: 0))
        return temp
    }()
    
    private lazy var dailyCount: UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
//        temp.isEnabled = false
        temp.placeholder = CitySearchViewLocalizables.dailyCountPlaceHolder.value
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        temp.font = SourceSansPro.SemiBold(16).value
        temp.textColor = ColorSpectrum.darkTheme
        temp.backgroundColor = ColorSpectrum.defaultWhite
        temp.layer.cornerRadius = 10
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addMainStackView()
    }
    
    private func addMainStackView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setViewData()
    }
    
    private func setViewData() {
        guard let data = returnData() else { return }
    }
    
    func getTextValues() -> (String, Int) {
        guard let count = dailyCount.text else { return ("istanbul", 16)}
        return (cityText.text ?? "istanbul", Int(count) ?? 16)
    }
    
}
