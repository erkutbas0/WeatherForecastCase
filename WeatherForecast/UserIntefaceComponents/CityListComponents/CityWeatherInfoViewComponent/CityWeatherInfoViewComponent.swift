//
//  CityWeatherInfoViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class CityWeatherInfoViewComponent: GenericBaseView<GenericRowDataProtocol> {
    
    private lazy var shadowContainerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = ColorSpectrum.defaultWhite
        temp.layer.cornerRadius = 10
        temp.layer.shadowColor = ColorSpectrum.darkTheme.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.8
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.clipsToBounds = true
        return temp
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    lazy var titleInfo: TitleInfoViewComponent = {
        let temp = TitleInfoViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var degreeValue: TempratureViewComponent = {
        let temp = TempratureViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        addUserInterfaceComponents()
    }
    
    private func addUserInterfaceComponents() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(backgroundImageView)
        containerView.addSubview(titleInfo)
        containerView.addSubview(degreeValue)

        NSLayoutConstraint.activate([
            
            shadowContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            shadowContainerView.heightAnchor.constraint(equalToConstant: 90),
            
            containerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            
            backgroundImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            titleInfo.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleInfo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),

            degreeValue.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            degreeValue.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        guard let data = returnData() as? CityWeatherInfoViewComponentData else { return }
        
        titleInfo.setData(data: data.titleInfo)
        degreeValue.setLabelData(data: data.degreeValue)
        backgroundImageView.image = data.backgroundImage
        
    }

}

