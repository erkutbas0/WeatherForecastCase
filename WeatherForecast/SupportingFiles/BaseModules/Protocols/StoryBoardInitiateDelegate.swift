//
//  StoryBoardInitiateDelegate.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//
import UIKit

public protocol StoryBoardInitiateDelegate {
    static var storyboard: StoryBoardIdentifiers { get }
    static func instantiate() -> Self?
}

extension StoryBoardInitiateDelegate where Self: UIViewController {
    static func instantiate() -> Self? {
        let identifier = String(describing: self)
        let uiStoryboard = UIStoryboard(name: storyboard.value, bundle: nil)
        guard let viewController = uiStoryboard.instantiateViewController(withIdentifier: identifier) as? Self else { return nil }

        return viewController
    }
}
