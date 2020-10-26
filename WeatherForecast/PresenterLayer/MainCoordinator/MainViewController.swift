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
        
        view.backgroundColor = .white
        
        addHeaderViewComponent()
        addHeaderViewComponentListeners()
        
        viewModel.getWeatherGroupForecastData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func addHeaderViewComponent() {
        headerViewComponent = HeaderViewComponent(data: viewModel.factory.returnHeaderViewComponentData())
        headerViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerViewComponent)
        
        NSLayoutConstraint.activate([
        
            headerViewComponent.topAnchor.constraint(equalTo: view.topAnchor),
            headerViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        
        ])
    }
    
    private func addHeaderViewComponentListeners() {
        headerViewComponent.subscribeRightIconListener { [weak self] in
            self?.viewModel.fireCitySearch()
        }
    }
}
