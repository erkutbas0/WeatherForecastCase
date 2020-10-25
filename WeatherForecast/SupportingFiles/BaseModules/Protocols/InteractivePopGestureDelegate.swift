//
//  InteractivePopGestureDelegate.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

protocol InteractivePopGestureDelegate: class {
    var initialInteractivePopGestureRecognizerDelegate: UIGestureRecognizerDelegate? { get set }
}

extension InteractivePopGestureDelegate where Self: UIViewController {
    func setInitialInteractivePopGestureRecognizerDelegate() {
        initialInteractivePopGestureRecognizerDelegate = self.navigationController?.interactivePopGestureRecognizer?.delegate
    }
    
    func assignInteractivePopGestureToNavigationController() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = initialInteractivePopGestureRecognizerDelegate
    }
    
    func resetInteractivePopGestureForNavigationController() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}
