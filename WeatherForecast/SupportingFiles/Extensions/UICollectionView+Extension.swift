//
//  UICollectionView+Extension.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import UIKit

extension UICollectionView {
    
    func genericRegisterCell<T>(_ type: T.Type) where T: BaseCollectionViewCell {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func genericDequeCell<T>(indexPath: IndexPath) -> T? where T: BaseCollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else { fatalError() }
        return cell
    }
    
}
