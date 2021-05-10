//
//  PersonCollectionViewCell.swift
//  testApp
//
//  Created by kkerors on 07.05.2021.
//

import Foundation
import UIKit

class PersonCollectionViewCell : UICollectionViewCell {
 
    let mainView = UIView()
    let personImageView = UIImageView()
    let personName = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(mainView)
        addSubview(personImageView)
        addSubview(personName)
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        setupMainView()
        setupPersonImageView()
        setupPersonName()
    }
    
    func setupMainView() {
        contentView.backgroundColor = .clear
        mainView.backgroundColor = UIColor(named: "BackgroundGray")
        mainView.layer.cornerRadius = 12
    }
    
    func setupPersonImageView() {
        personImageView.contentMode = .scaleToFill
    }
    
    func setupPersonName() {
        personName.textColor = UIColor(named: "HeaderColor")
        personName.font = UIFont.systemFont(ofSize: 12)
    }
    
    //MARK: Snapkit
    
    func setupConstraints() {
        mainView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        personImageView.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.top).offset(22)
            $0.left.equalTo(mainView.snp.left).offset(29)
            $0.right.equalTo(mainView.snp.right).offset(-29)
            $0.bottom.equalTo(mainView.snp.centerY)
        }
        
        personName.snp.makeConstraints {
            $0.centerX.equalTo(mainView.snp.centerX)
            $0.bottom.equalTo(mainView.snp.bottom).offset(-20)
        }
    }
    
    func fillInPersonCell(person: Person?) {
        personImageView.image = person?.image
        personName.text = person?.name
    }
    
}
