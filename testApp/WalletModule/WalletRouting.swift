//
//  WalletRouting.swift
//  testApp
//
//  Created by kkerors on 06.05.2021.
//

import Foundation
import UIKit

class WalletRouting {
    
    static func presentWalletViewController(fromVC: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContainerViewController") as! ContainerViewController
        vc.modalPresentationStyle = .fullScreen
        fromVC.present(vc, animated: true, completion: nil)
    }
    
}
