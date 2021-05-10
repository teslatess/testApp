//
//  CurrentBalanceView.swift
//  testApp
//
//  Created by kkerors on 07.05.2021.
//

import Foundation
import UIKit
import SnapKit

class CurrentBalanceView: UIView {
    
    // MARK: UIViews
    
    let balanceValueLabel = UILabel()
    let currentBalanceLabel = UILabel()
    let circleView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup(){
        addSubview(balanceValueLabel)
        addSubview(currentBalanceLabel)
        addSubview(circleView)
        
        setupCircleView()
        setupBalanceValueLabel()
        setupCurrentBalanceLabel()
        setupConstraints()
    }
    
    func setupCircleView() {
        circleView.image = UIImage(named: "AddCircle")
        circleView.contentMode = .scaleToFill
    }
    
    func setupBalanceValueLabel() {
        balanceValueLabel.font = UIFont.systemFont(ofSize: 24)
        balanceValueLabel.textColor = UIColor(named: "DefaultText")
    }
    
    func setupCurrentBalanceLabel() {
        currentBalanceLabel.font = UIFont.systemFont(ofSize: 12)
        currentBalanceLabel.textColor = UIColor(named: "DefaultGray")
    }
    
    //MARK: Snapkit
    
    func setupConstraints(){
        
        balanceValueLabel.snp.makeConstraints{
            $0.left.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(26)
        }
        
        currentBalanceLabel.snp.makeConstraints {
            $0.left.equalTo(balanceValueLabel.snp.left)
            $0.bottom.equalToSuperview().offset(-26)
        }
        
        circleView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-25)
            $0.width.equalTo(48)
            $0.height.equalTo(48)
        }
        
    }
    
}
