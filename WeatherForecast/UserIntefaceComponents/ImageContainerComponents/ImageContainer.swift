//
//  ImageContainer.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 25.10.2020.
//

import UIKit

typealias ImageTappedCompletion = () -> Void

class ImageContainer: GenericBaseView<ImageContainerData> {
    
    private var imageTapped: ImageTappedCompletion?
    
    lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addImageView()
        addGestureRecognizer()
    }
    
    private func addImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
        
            imageView.heightAnchor.constraint(equalToConstant: returnContentSize().0),
            imageView.widthAnchor.constraint(equalToConstant: returnContentSize().1),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        guard let data = returnData() else { return }
        imageView.image = data.image.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = data.tintColor
        
    }
    
    private func returnContentSize() -> (CGFloat, CGFloat) {
        guard let data = returnData() else { return (20, 20) }
        return (data.height, data.width)
    }
    
    func subscribeImageContainerTappedListener(completion: @escaping ImageTappedCompletion) {
        imageTapped = completion
    }
    
}


extension ImageContainer: UIGestureRecognizerDelegate {
    private func addGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: .imageTappedAction)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func imageTappedAction(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startPressedAnimationCommon { [weak self](finish) in
            if finish {
                self?.isUserInteractionEnabled = true
                self?.imageTapped?()
            }
        }
    }
}

fileprivate extension Selector {
    static let imageTappedAction = #selector(ImageContainer.imageTappedAction)
}
