//
//  DailyDetailViewController.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class DailyDetailViewController: BaseViewController<DailyDetailViewModel> {
    
    private var detailViewComponent: DailyForecastDetailViewComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()

        setupViewProperties()
        
        addDetailViewComponent()
        
    }
    
    private func setupViewProperties() {
        view.backgroundColor = ColorSpectrum.defaultBackground
    }
    
    private func addDetailViewComponent() {
        detailViewComponent = DailyForecastDetailViewComponent()
        detailViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(detailViewComponent)
        
        NSLayoutConstraint.activate([
        
            detailViewComponent.topAnchor.constraint(equalTo: view.safeTopAnchor),
            detailViewComponent.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            detailViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        
        ])
    }
    
    deinit {
        print("DEINIT DailyDetailViewController")
    }
    
}

