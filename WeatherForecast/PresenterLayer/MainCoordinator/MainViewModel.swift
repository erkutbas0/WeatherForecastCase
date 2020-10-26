//
//  MainViewModel.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class MainViewModel: BaseViewModelDelegate {
    
    private var coreDataManager: CoreDataManager!
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func dismissCoordinator() {
        
    }
    
    deinit {
        print("DEINIT MainViewModel")
    }
}
