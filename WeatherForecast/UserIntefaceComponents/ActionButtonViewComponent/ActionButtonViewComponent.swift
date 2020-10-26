//
//  ActionButtonViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class ActionButtonViewComponent: GenericBaseView<ActionButtonViewComponentData> {
    
    private var buttonTapped: ButtonPressed?
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.layer.shadowColor = ColorSpectrum.darkTheme.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 4)
        temp.layer.shadowRadius = 6
        temp.layer.shadowOpacity = 0.6
        return temp
    }()
    
    private lazy var title: BasicAttributedLabel = {
        let temp = BasicAttributedLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()

    override func setupViews() {
        super.setupViews()
        
        addGestureRecognizer()
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addUserInterfaceComponents()
    }
        
    private func addUserInterfaceComponents() {

        addSubview(containerView)
        containerView.addSubview(title)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            
            title.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()

        guard let data = returnData() else { return }
        containerView.backgroundColor = data.backgroundColor
        title.setLabelData(data: data.title)
        
    }
    
    func subscribeActionButtonViewComponent(completion: @escaping ButtonPressed) {
        buttonTapped = completion
    }
    
}

extension ActionButtonViewComponent: UIGestureRecognizerDelegate {
    private func addGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: .buttonTappedAction)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func buttonTappedAction(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startPressedAnimationCommon { [weak self](finish) in
            if finish {
                self?.isUserInteractionEnabled = true
                self?.buttonTapped?(true)
            }
        }
    }
}

fileprivate extension Selector {
    static let buttonTappedAction = #selector(ActionButtonViewComponent.buttonTappedAction)
}

