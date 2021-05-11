//
//  ServiceCollectionViewCell.swift
//  testApp
//
//  Created by kkerors on 07.05.2021.
//

import Foundation
import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    private weak var mainView: UIView!
    private weak var serviceImageContainer: UIView!
    private weak var serviceImageView: UIImageView!
    private weak var serviceNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        setupMainView()
        setupServiceImageContainer()
        setupServiceImageView()
        setupServiceNameLabel()
    }
    
    private func setupMainView() {
        let mainView = UIView()
        contentView.backgroundColor = .clear
        mainView.backgroundColor = .clear
        mainView.layer.cornerRadius = 12
        self.mainView = mainView
        addSubview(self.mainView)
    }
    
    private func setupServiceImageContainer() {
        let serviceImageContainer = UIView()
        serviceImageContainer.backgroundColor = UIColor(named: "BackgroundGray")
        serviceImageContainer.layer.cornerRadius = 12
        self.serviceImageContainer = serviceImageContainer
        addSubview(self.serviceImageContainer)
    }
    
    private func setupServiceImageView() {
        let serviceImageView = UIImageView()
        serviceImageView.contentMode = .scaleAspectFit
        self.serviceImageView = serviceImageView
        serviceImageContainer.addSubview(self.serviceImageView)
    }
    
    private func setupServiceNameLabel() {
        let serviceNameLabel = UILabel()
        serviceNameLabel.textColor = UIColor(named: "DefaultGray")
        
        if UIDevice.modelName == "iPhone SE" {
            serviceNameLabel.font = UIFont.boldSystemFont(ofSize: 7)
        } else {
            serviceNameLabel.font = UIFont.boldSystemFont(ofSize: 10)
        }
        
        serviceNameLabel.numberOfLines = 0
        serviceNameLabel.textAlignment = .center
        serviceNameLabel.lineBreakMode = .byWordWrapping
        self.serviceNameLabel = serviceNameLabel
        addSubview(self.serviceNameLabel)
    }
    
    //MARK: Snapkit
    
    private func setupConstraints() {
        
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
        
        serviceNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(mainView.snp.centerX)
            $0.top.equalTo(serviceImageContainer.snp.bottom).offset(6)
            $0.left.equalTo(mainView.snp.left).offset(15)
            $0.right.equalTo(mainView.snp.right).offset(-15)
        }
    }
    
    func fillInServiceCell(service: Service?) {
        serviceImageView.image = service?.image
        serviceNameLabel.text = service?.name
    }
    
    
}
