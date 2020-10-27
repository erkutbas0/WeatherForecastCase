//
//  UIViewController+Extension.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 27.10.2020.
//

import UIKit

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// Mark: - AlertView Extensions -
extension UIViewController {
    
    func fireCustomAlert(data: CustomAlertData, completion: (() -> Void)?) {
        let alert = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: WarningLocalizables.warningTitle.value, style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
}
