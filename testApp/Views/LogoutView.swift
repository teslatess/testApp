//
//  LogoutView.swift
//  testApp
//
//  Created by kkerors on 10.05.2021.
//

import Foundation
import  UIKit
import SnapKit

class LogoutView: UIView {
    
    // MARK: UIViews
    
    let logoutImageView = UIImageView()
    let logoutLabel = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup(){
        addSubview(logoutImageView)
        addSubview(logoutLabel)
        
        setupMainView()
        setupLogoutImageView()
        setupLogoutLabel()
        setupConstraints()
    }
    
    func setupMainView() {
        backgroundColor = .clear
    }
    
    func setupLogoutImageView() {
        logoutImageView.image = UIImage(named: "Power")
        logoutImageView.contentMode = .scaleAspectFill
    }
    
    func setupLogoutLabel() {
        logoutLabel.font = UIFont.boldSystemFont(ofSize: 16)
        logoutLabel.textColor = UIColor(named: "DefaultText")
        logoutLabel.text = "Logout"
    }
    
    //MARK: Snapkit
    
    func setupConstraints(){
        
        logoutImageView.snp.makeConstraints{
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(18)
        }
        
        logoutLabel.snp.makeConstraints {
            $0.centerY.equalTo(logoutImageView)
            $0.left.equalTo(logoutImageView.snp.right).offset(8)
        }
    }
}
