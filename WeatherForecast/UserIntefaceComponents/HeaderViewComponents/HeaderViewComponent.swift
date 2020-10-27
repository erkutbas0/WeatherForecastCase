//
//  HeaderViewComponents.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 25.10.2020.
//

import UIKit

class HeaderViewComponent: GenericBaseView<HeaderViewComponentData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var headTitle: BasicAttributedLabel = {
        let temp = BasicAttributedLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private var leftIcon: ImageContainer!
    private var rightIcon: ImageContainer!
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addUserInterfaceComponents()
    }
        
    private func addUserInterfaceComponents() {

        addSubview(containerView)
        containerView.addSubview(headTitle)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 160),
            
            headTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            headTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()

        guard let data = returnData() else { return }
        headTitle.setLabelData(data: data.title)
        setupThemeConfigurations()
        setLeftIconData()
        setRightIconData()
        
    }
    
    private func setupThemeConfigurations() {
        guard let data = returnData() else { return }
        switch data.theme {
        case .dark:
            containerView.backgroundColor = ColorSpectrum.darkTheme
        case .light:
            containerView.backgroundColor = ColorSpectrum.defaultWhite
        }
    }
    
    private func setLeftIconData() {
        guard let data = returnData(), let imageContainerData = data.leftIcon else { return }
        leftIcon = ImageContainer(data: imageContainerData)
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(leftIcon)
        
        NSLayoutConstraint.activate([
        
            leftIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            leftIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
        
        ])
        
    }
    
    private func setRightIconData() {
        guard let data = returnData(), let imageContainerData = data.rightIcon else { return }
        rightIcon = ImageContainer(data: imageContainerData)
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(rightIcon)
        
        NSLayoutConstraint.activate([
        
            rightIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            rightIcon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
        
        ])
    }
    
    func subscribeRightIconListener(completin: @escaping ImageTappedCompletion) {
        rightIcon.subscribeImageContainerTappedListener(completion: completin)
    }
    
    func subscribeLeftIconListener(completin: @escaping ImageTappedCompletion) {
        leftIcon.subscribeImageContainerTappedListener(completion: completin)
    }
    
}
