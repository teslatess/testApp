//
//  WalletPresenter.swift
//  testApp
//
//  Created by kkerors on 06.05.2021.
//

import Foundation

protocol WalletView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
}

class WalletPresenter {
    
    fileprivate let walletService: WalletService
    weak fileprivate var walletView: WalletView?
    
    init(walletService: WalletService){
        self.walletService = walletService
    }
    
    func attachView(_ view: WalletView){
        walletView = view
    }
    
    func detachView() {
        walletView = nil
    }
    
    func pushButtonBressed() {
        
    }
    
}
