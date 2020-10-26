//
//  TitleInfoViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class TitleInfoViewComponent: GenericBaseView<TitleInfoViewComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [timeInfo, cityName])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var timeInfo: BasicAttributedLabel = {
        let temp = BasicAttributedLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var cityName: BasicAttributedLabel = {
        let temp = BasicAttributedLabel()
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
        timeInfo.setLabelData(data: data.timeInfo)
        cityName.setLabelData(data: data.cityName)
    }
    
}
