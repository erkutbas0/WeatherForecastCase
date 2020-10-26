//
//  MainViewController.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    private var headerViewComponent: HeaderViewComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addHeaderViewComponent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addHeaderViewComponent() {
        view.backgroundColor = ColorSpectrum.defaultBackground
        
        headerViewComponent = HeaderViewComponent(data: HeaderViewComponentData(title: BasicAttributedLabelData(text: "Cities").setTextFont(with: [SourceSansPro.SemiBold(40).value])).setRightIcon(by: ImageContainerData().setImage(with: VisualContents.searchIcon.value).setWidth(with: 40).setHeight(with: 40)))
        headerViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerViewComponent)
        
        NSLayoutConstraint.activate([
        
            headerViewComponent.topAnchor.constraint(equalTo: view.topAnchor),
            headerViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        
        ])
    }
}
