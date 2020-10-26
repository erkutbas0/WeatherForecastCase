//
//  UIView+Extension.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//


import UIKit

// MARK: - Animation Extensions -
extension UIView {

    public func startPressedAnimationCommon(withDuration: CGFloat = 0.3, completion: @escaping (_ finish: Bool) -> Void) {

        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) // buton view kucultulur

        UIView.animate(withDuration: TimeInterval(withDuration),
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.8),  // yay sonme orani, arttikca yanip sonme artar
            initialSpringVelocity: CGFloat(6.0),    // yay hizi, arttikca hizlanir
            options: UIView.AnimationOptions.allowUserInteraction,
            animations: {

                self.transform = CGAffineTransform.identity

        }, completion: completion)

        self.layoutIfNeeded()
    }
    
}

// Mark: - SafeArea Functions -
extension UIView {

    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }

}
