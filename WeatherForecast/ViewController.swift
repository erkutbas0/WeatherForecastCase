//
//  ViewController.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    private var test: HeaderViewComponent!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = ColorSpectrum.defaultBackground
        
        test = HeaderViewComponent(data: HeaderViewComponentData(title: BasicAttributedLabelData(text: "Cities").setTextFont(with: [SourceSansPro.SemiBold(40).value])).setRightIcon(by: ImageContainerData().setImage(with: VisualContents.searchIcon.value).setWidth(with: 40).setHeight(with: 40)))
        test.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(test)
        
        NSLayoutConstraint.activate([
        
            test.topAnchor.constraint(equalTo: view.topAnchor),
            test.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            test.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        
        ])
    }


}

