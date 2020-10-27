//
//  DailyInfoView.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

class DailyInfoView: GenericBaseView<GenericDataProtocol> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [dayInfo, weatherIcon, tempInfo])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 20
        return temp
    }()
    
    private lazy var dayInfo: BasicAttributedLabel = {
        let temp = BasicAttributedLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.widthAnchor.constraint(equalToConstant: 140).isActive = true
        return temp
    }()

    private lazy var weatherIcon: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setContentHuggingPriority(UILayoutPriority.init(252), for: .horizontal)
        return temp
    }()

    private lazy var tempInfo: TempratureDetailComponent = {
        let temp = TempratureDetailComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addMainStackView()
    }
    
    private func addMainStackView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setViewData()
    }
    
    private func setViewData() {
        guard let data = returnData() as? DailyInfoViewData else { return }
        dayInfo.setLabelData(data: data.dayText)
        weatherIcon.setData(data: data.iconUrl)
        tempInfo.setData(data: data.tempratureData)
    }
    
}
