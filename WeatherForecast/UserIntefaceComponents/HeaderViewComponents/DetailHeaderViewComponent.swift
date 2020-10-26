//
//  DetailHeaderViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class DetailHeaderViewComponent: GenericBaseView<DetailHeaderViewComponentData> {
    
    private var leftIcon: ImageContainer!
    private var headerMiddleInfo: DetailInfoViewComponent!
    
    override func addMajorFields() {
        super.addMajorFields()
        
        backgroundColor = .red
        addDetailInfoViewComponent()
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        setLeftIconData()
        
    }
    
    private func setLeftIconData() {
        guard let data = returnData(), let imageContainerData = data.leftIcon else { return }
        leftIcon = ImageContainer(data: imageContainerData)
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftIcon)
        
        NSLayoutConstraint.activate([
        
            leftIcon.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            leftIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
        
        ])
        
    }
    
    func subscribeLeftIconListener(completin: @escaping ImageTappedCompletion) {
        leftIcon.subscribeImageContainerTappedListener(completion: completin)
    }
    
    private func addDetailInfoViewComponent() {
        guard let data = returnData() else { return }
        headerMiddleInfo = DetailInfoViewComponent(data: data.middleInfo)
        headerMiddleInfo.translatesAutoresizingMaskIntoConstraints = false
         
        addSubview(headerMiddleInfo)
        
        NSLayoutConstraint.activate([
        
            headerMiddleInfo.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerMiddleInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
        
        
    }
    
}
