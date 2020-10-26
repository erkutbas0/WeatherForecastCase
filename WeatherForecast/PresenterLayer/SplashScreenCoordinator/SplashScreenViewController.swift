//
//  SplashScreenViewController.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//


import UIKit

class SplashScreenViewController: BaseViewController<SplashScreenViewModel>, AwakingStoryBoardDelegate {
    static var storyboard: ApplicationStoryBoards {
        return .splashScreen
    }
    
    @IBOutlet weak var containerViewBottomConstraint: NSLayoutConstraint!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        viewModel.startSplashProcess()
        splashViewAnimationTrigger()
        
    }
    
    private func splashViewAnimationTrigger() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.fireSplashViewAnimation()
        }
        
    }
    
    private func fireSplashViewAnimation() {
        containerViewBottomConstraint.constant = -40
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.4),  // yay sonme orani, arttikca yanip sonme artar
            initialSpringVelocity: CGFloat(10.0),    // yay hizi, arttikca hizlanir
            options: .curveEaseIn,
            animations: {

                self.view.layoutIfNeeded()

        })
    }
    
    deinit {
        print("DEINIT SplashScreenViewController")
    }
    
}
