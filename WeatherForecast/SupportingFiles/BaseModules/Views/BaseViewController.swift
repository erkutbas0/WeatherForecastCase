//
//  BaseViewController.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Foundation
import UIKit

class BaseViewController<T: BaseViewModelDelegate>: UIViewController, InteractivePopGestureDelegate, ViewControllerTypeProtocol {
    
    var viewTitle: String? { return nil }
    
    var initialInteractivePopGestureRecognizerDelegate: UIGestureRecognizerDelegate?

    var viewModel: T!
    
    convenience init(viewModel: T) {
        self.init()
        self.viewModel = viewModel
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setInitialInteractivePopGestureRecognizerDelegate()
        prepareViewControllerConfigurations()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetInteractivePopGestureForNavigationController()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assignInteractivePopGestureToNavigationController()
    }
    
    open override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            viewModel.dismissCoordinator()
        }
    }
    
    open func prepareViewControllerConfigurations() {
        view.backgroundColor = .white
        setViewControllerName()
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    private func setViewControllerName() {
        title = viewTitle
    }
    
}
