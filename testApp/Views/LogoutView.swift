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
    
    private weak var logoutImageView: UIImageView!
    private weak var logoutLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup(){
        setupMainView()
        setupLogoutImageView()
        setupLogoutLabel()
        setupConstraints()
    }
    
    private func setupMainView() {
        backgroundColor = .clear
    }
    
    private func setupLogoutImageView() {
        let logoutImageView = UIImageView()
        logoutImageView.image = UIImage(named: "Power")
        logoutImageView.contentMode = .scaleAspectFill
        self.logoutImageView = logoutImageView
        addSubview(self.logoutImageView)
    }
    
    private func setupLogoutLabel() {
        let logoutLabel = UILabel()
        logoutLabel.font = UIFont.boldSystemFont(ofSize: 16)
        logoutLabel.textColor = UIColor(named: "DefaultText")
        logoutLabel.text = "Logout"
        self.logoutLabel = logoutLabel
        addSubview(self.logoutLabel)
    }
    
    //MARK: Snapkit
    
    private func setupConstraints(){
        
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
