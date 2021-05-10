//
//  LoginPresenter.swift
//  testApp
//
//  Created by kkerors on 04.05.2021.
//

import Foundation
import UIKit

protocol LoginView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
}

class LoginPresenter {
    
    fileprivate let loginService: LoginService
    weak fileprivate var loginView: LoginView?
    
    init(loginService: LoginService){
        self.loginService = loginService
    }
    
    func attachView(_ view: LoginView){
        loginView = view
    }
    
    func detachView() {
        loginView = nil
    }
    
    func pushButtonPressed(_ vc: UIViewController) {
        WalletRouting.presentWalletViewController(fromVC: vc)
    }
    
}
