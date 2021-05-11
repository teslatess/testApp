//
//  ContainerViewController.swift
//  testApp
//
//  Created by kkerors on 09.05.2021.
//

import Foundation
import UIKit

class ContainerViewController: UIViewController {
    
    private weak var controller: UIViewController!
    private weak var menuViewController: UIViewController!
    
    private var isMove = false
    
    override func viewDidLoad() {
        configureWalletViewController()
    }
    
    private func configureWalletViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let walletViewController = storyboard.instantiateViewController(withIdentifier: "WalletViewController") as! WalletViewController
        walletViewController.delegate = self
        controller = walletViewController
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    private func configureMenuViewController() {
        if menuViewController == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let menuController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            menuController.delegate = self
            menuViewController = menuController
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
        }
    }
    
    private func showMenuViewController(_ shouldMove: Bool) {
        if shouldMove {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                
                self.controller.view.frame.origin.x = self.controller.view.frame.width/2
                self.controller.view.frame.origin.y = self.controller.view.frame.height/5
                self.controller.view.layer.cornerRadius = 14
                self.controller.view.layer.masksToBounds = true
            
            } completion: { finished in
                //
            }

        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.controller.view.frame.origin.x = 0
                self.controller.view.frame.origin.y = 0
                self.controller.view.layer.cornerRadius = 0
            } completion: { finished in
                //
            }
        }
    }
    
}

// MARK: MenuViewControllerDelegate

extension ContainerViewController: MenuViewControllerDelegate {
    func hideMenu() {
        isMove = !isMove
        showMenuViewController(isMove)
    }
}

// MARK: WalletViewControllerDelegate

extension ContainerViewController: WalletViewControllerDelegate {
    func toggleMenu() {
        configureMenuViewController()
        isMove = !isMove
        showMenuViewController(isMove)
    }
}
