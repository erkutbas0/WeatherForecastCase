//
//  DetailHeaderViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class DetailHeaderViewComponent: GenericBaseView<DetailHeaderViewComponentData> {
    
    private var headerMiddleInfo: DetailInfoViewComponent!
    var headerBottomInfo: DetailDegreeInfoComponent!
    var leftIcon: ImageContainer!
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ColorSpectrum.defaultWhite
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addDetailInfoViewComponent()
        addDetailDegreeInfoComponent()
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
        
            leftIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            leftIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        
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
    
    private func addDetailDegreeInfoComponent() {
        guard let data = returnData() else { return }
        headerBottomInfo = DetailDegreeInfoComponent(data: data.bottomInfo)
        headerBottomInfo.translatesAutoresizingMaskIntoConstraints = false
         
        addSubview(headerBottomInfo)
        
        NSLayoutConstraint.activate([
        
            headerBottomInfo.topAnchor.constraint(equalTo: headerMiddleInfo.bottomAnchor),
            headerBottomInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
        
    }
    
}
