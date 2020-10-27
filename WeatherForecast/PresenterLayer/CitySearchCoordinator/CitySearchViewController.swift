//
//  CitySearchViewController.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit
import RxSwift

class CitySearchViewController: BaseViewController<CitySearchViewModel> {
    
    private let disposeBag = DisposeBag()
    
    private var headerViewComponent: HeaderViewComponent!
    private var filterViewComponent: FilterViewComponent!
    private var actionButtonViewComponent: ActionButtonViewComponent!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()

        setupViewProperties()
        
        // Mark: - HeaderViewComponents -
        addHeaderViewComponent()
        addHeaderViewComponentListeners()
        
        // Mark: - FilterViewComponents -
        addFilterViewComponent()
        
        // Mark: - ActionButtonViewComponent -
        addActionButtonViewComponent()
        addActionButtonViewComponentListeners()
        
        // Mark: - ViewModel Listeners -
        addViewModelListeners()
    }
    
    private func setupViewProperties() {
        view.backgroundColor = ColorSpectrum.defaultBackground
        hideKeyboardWhenTappedAround()
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
        headerViewComponent.subscribeLeftIconListener { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            self?.viewModel.dismissCoordinator()
        }
    }
    
    private func addFilterViewComponent() {
        filterViewComponent = FilterViewComponent(data: viewModel.factory.returnFilterViewComponentData())
        filterViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(filterViewComponent)
        
        NSLayoutConstraint.activate([
        
            filterViewComponent.topAnchor.constraint(equalTo: headerViewComponent.bottomAnchor, constant: 40),
            filterViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            filterViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        
        
        ])
        
    }
    
    private func addActionButtonViewComponent() {
        actionButtonViewComponent = ActionButtonViewComponent(data: viewModel.factory.returnActionButtonViewComponentData())
        actionButtonViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(actionButtonViewComponent)
        
        NSLayoutConstraint.activate([
        
            actionButtonViewComponent.bottomAnchor.constraint(equalTo: view.safeBottomAnchor, constant: -30),
            actionButtonViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            actionButtonViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        
        
        ])
    }
    
    private func addActionButtonViewComponentListeners() {
        actionButtonViewComponent.subscribeActionButtonViewComponent { [weak self](pressed) in
            print("pressed")
            self?.startToGetDailyData()
        }
    }
    
    private func startToGetDailyData() {
        viewModel.getDailyForecastData(textFieldsData: filterViewComponent.getTextValues())
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeErrorPublisher { [weak self](alertData) in
            self?.fireCustomAlert(data: alertData, completion: nil)
        }?.disposed(by: disposeBag)
        
        viewModel.subscribeActivityStatePublisher { [weak self](state) in
            switch state {
            case .active:
                self?.startIndicatingActivity()
            case .passive:
                self?.stopIndicatingActivity()
            }
        }?.disposed(by: disposeBag)
    }
    
    deinit {
        print("DEINIT CitySearchViewController")
    }
    
}

