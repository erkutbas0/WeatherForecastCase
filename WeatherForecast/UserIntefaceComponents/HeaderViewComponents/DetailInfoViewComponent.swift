//
//  DetailInfoViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

class DetailInfoViewComponent: GenericBaseView<DetailInfoViewComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [cityName, weatherMainInfo, degreeInfo, degreeDetailInfo])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var cityName: BasicAttributedLabel = {
        let temp = BasicAttributedLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var weatherMainInfo: BasicAttributedLabel = {
        let temp = BasicAttributedLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    private lazy var degreeInfo: TempratureViewComponent = {
        let temp = TempratureViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    private lazy var degreeDetailInfo: TempratureDetailComponent = {
        let temp = TempratureDetailComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
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
        
        cityName.setLabelData(data: data.cityName)
        weatherMainInfo.setLabelData(data: data.weatherMainInfo)
        degreeInfo.setLabelData(data: data.degreeInfo)
        degreeDetailInfo.setData(data: data.tempDetail)
    }
    
}
