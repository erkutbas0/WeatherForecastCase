//
//  WeatherForecastCoreDataManager.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import Foundation
import CoreData

class WeatherForecastCoreDataManager: WeatherForecastCoreDataManagerInterface {
    
    private var coreDataManager: CoreDataManager!
    private var cityList = Array<RegisteredCityList>()
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func saveToCoreData(id: Int64, name: String) {
        
        fetchRegisteredCity()
        
        if !checkCityExist(cityId: id) {
            let object = RegisteredCityList(context: coreDataManager.context)
            object.cityId = id
            object.name = name
            
            coreDataManager.saveContext()
        }
        
    }
    
    func getRegisteredCityList() -> Array<RegisteredCityList> {
        return coreDataManager.fetch(RegisteredCityList.self)
    }
    
    func removeFromCoreData(id: Int64) {
        guard let object = coreDataManager.fetchWithPredicate(RegisteredCityList.self, predicateKey: "cityId = %@", predicateValue: "\(id)") else { return }
        coreDataManager.delete(object)
        coreDataManager.saveContext()
    }
    
    private func checkCityExist(cityId: Int64) -> Bool {
        cityList.contains { (item) -> Bool in
            if item.cityId == cityId {
                return true
            } else {
                return false
            }
        }
    }
    
    private func fetchRegisteredCity() {
        cityList.removeAll()
        cityList = coreDataManager.fetch(RegisteredCityList.self)
    }
    
}
