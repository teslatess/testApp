//
//  ServiceCollectionViewCell.swift
//  testApp
//
//  Created by kkerors on 07.05.2021.
//

import Foundation
import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    let mainView = UIView()
    let serviceImageContainer = UIView()
    let serviceImageView = UIImageView()
    let serviceName = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(mainView)
        addSubview(serviceImageContainer)
        serviceImageContainer.addSubview(serviceImageView)
        addSubview(serviceName)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        setupMainView()
        setupServiceImageContainer()
        setupServiceImageView()
        setupServiceName()
    }
    
    func setupMainView() {
        contentView.backgroundColor = .clear
        mainView.backgroundColor = .clear
        mainView.layer.cornerRadius = 12
    }
    
    func setupServiceImageContainer() {
        serviceImageContainer.backgroundColor = UIColor(named: "BackgroundGray")
        serviceImageContainer.layer.cornerRadius = 12
    }
    
    func setupServiceImageView() {
        serviceImageView.contentMode = .scaleAspectFit
    }
    
    func setupServiceName() {
        serviceName.textColor = UIColor(named: "DefaultGray")
        
        if UIDevice.modelName == "iPhone SE" {
            serviceName.font = UIFont.boldSystemFont(ofSize: 7)
        } else {
            serviceName.font = UIFont.boldSystemFont(ofSize: 10)
        }
        
        serviceName.numberOfLines = 0
        serviceName.textAlignment = .center
        serviceName.lineBreakMode = .byWordWrapping
    }
    
    //MARK: Snapkit
    
    func setupConstraints() {
        
        mainView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        serviceImageContainer.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(60)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        serviceImageView.snp.makeConstraints {
            $0.centerX.equalTo(serviceImageContainer.snp.centerX)
            $0.centerY.equalTo(serviceImageContainer.snp.centerY)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        serviceName.snp.makeConstraints {
            $0.centerX.equalTo(mainView.snp.centerX)
            $0.top.equalTo(serviceImageContainer.snp.bottom).offset(6)
            $0.left.equalTo(mainView.snp.left).offset(15)
            $0.right.equalTo(mainView.snp.right).offset(-15)
        }
    }
    
    func fillInServiceCell(service: Service?) {
        serviceImageView.image = service?.image
        serviceName.text = service?.name
    }
    
    
}
