//
//  PersonCollectionViewCell.swift
//  testApp
//
//  Created by kkerors on 07.05.2021.
//

import Foundation
import UIKit

class PersonCollectionViewCell : UICollectionViewCell {
 
    private weak var mainView: UIView!
    private weak var personImageView: UIImageView!
    private weak var personNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        setupMainView()
        setupPersonImageView()
        setupPersonNameLabel()
    }
    
    private func setupMainView() {
        let mainView = UIView()
        contentView.backgroundColor = .clear
        mainView.backgroundColor = UIColor(named: "BackgroundGray")
        mainView.layer.cornerRadius = 12
        self.mainView = mainView
        addSubview(self.mainView)
    }
    
    private func setupPersonImageView() {
        let personImageView = UIImageView()
        personImageView.contentMode = .scaleToFill
        self.personImageView = personImageView
        addSubview(self.personImageView)
    }
    
    private func setupPersonNameLabel() {
        let personNameLabel = UILabel()
        personNameLabel.textColor = UIColor(named: "HeaderColor")
        personNameLabel.font = UIFont.systemFont(ofSize: 12)
        self.personNameLabel = personNameLabel
        addSubview(self.personNameLabel)
    }
    
    //MARK: Snapkit
    
    private func setupConstraints() {
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
        
        personNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(mainView.snp.centerX)
            $0.bottom.equalTo(mainView.snp.bottom).offset(-20)
        }
    }
    
    func fillInPersonCell(person: Person?) {
        personImageView.image = person?.image
        personNameLabel.text = person?.name
    }
    
}
