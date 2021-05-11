//
//  PersonView.swift
//  testApp
//
//  Created by kkerors on 10.05.2021.
//

import Foundation
import UIKit
import  SnapKit

class PersonView: UIView {
    
    // MARK: UIViews
    
    private weak var personImageView: UIImageView!
    private weak var personNameLabel: UILabel!
    private weak var personLocationLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup(){
        setupMainView()
        setupPersonImageView()
        setupPersonNameLabel()
        setupPersonLocationLabel()
        setupConstraints()
    }
    
    private func setupMainView() {
        backgroundColor = UIColor(named: "DefaultBackground")
        clipsToBounds = true
        layer.cornerRadius = 14
        layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    private func setupPersonImageView() {
        let personImageView = UIImageView()
        personImageView.image = UIImage(named: "Carol")
        personImageView.contentMode = .scaleAspectFill
        self.personImageView = personImageView
        addSubview(self.personImageView)
    }
    
    private func setupPersonNameLabel() {
        let personNameLabel = UILabel()
        personNameLabel.font = UIFont.systemFont(ofSize: 16)
        personNameLabel.textColor = UIColor(named: "DefaultText")
        personNameLabel.text = "Carol Black"
        self.personNameLabel = personNameLabel
        addSubview(self.personNameLabel)
    }
    
    private func setupPersonLocationLabel() {
        let personLocationLabel = UILabel()
        personLocationLabel.font = UIFont.systemFont(ofSize: 10)
        personLocationLabel.textColor = UIColor(named: "DefaultGray")
        personLocationLabel.text = "Seattle,Washington"
        self.personLocationLabel = personLocationLabel
        addSubview(self.personLocationLabel)
    }
    
    //MARK: Snapkit
    
    private func setupConstraints(){
        
        personImageView.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-30)
            $0.left.equalToSuperview().offset(32)
            $0.height.equalTo(40)
            $0.width.equalTo(40)
        }
        
        personNameLabel.snp.makeConstraints {
            $0.left.equalTo(personImageView.snp.right).offset(10)
            $0.top.equalTo(personImageView).offset(5)
        }
        
        personLocationLabel.snp.makeConstraints {
            $0.left.equalTo(personNameLabel)
            $0.bottom.equalTo(personImageView).offset(-5)
        }
        
    }
    
}
