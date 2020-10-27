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
        view.backgroundColor = ColorSpectrum.defaultWhite
    }
    
    private func addDetailViewComponent() {
        guard let data = viewModel.getDailyForecastDetailViewComponentData() else { return }
        detailViewComponent = DailyForecastDetailViewComponent(data: data)
        detailViewComponent.setDelegate(delegate: self)
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

extension DailyDetailViewController: DailyForecastDetailViewComponentDelegate {
    func numberOfSection() -> Int {
        return viewModel.returnNumberOfSection()
    }
    
    func numberOfItems(in section: Int) -> Int {
        return viewModel.returnNumberOfItems(in: 0)
    }
    
    func getItemData(at index: Int) -> GenericDataProtocol? {
        return viewModel.returnDataItem(at: index)
    }
    
    
}
