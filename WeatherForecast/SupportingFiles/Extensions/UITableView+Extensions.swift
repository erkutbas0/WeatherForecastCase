//
//  UITableView+Extensions.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//


import UIKit

extension UITableView {
    
    func genericRegister<T>(_ type: T.Type) where T: BaseTableViewCell {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func genericDequeCell<T>(indexPath: IndexPath) -> T where T: BaseTableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { fatalError() }
        return cell
    }
}
