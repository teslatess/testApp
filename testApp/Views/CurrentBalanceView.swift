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
    
    private weak var balanceValueLabel: UILabel!
    private weak var currentBalanceLabel: UILabel!
    private weak var circleView: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup(){
        setupCircleView()
        setupBalanceValueLabel()
        setupCurrentBalanceLabel()
        setupConstraints()
    }
    
    private func setupCircleView() {
        let circleView = UIImageView()
        circleView.image = UIImage(named: "AddCircle")
        circleView.contentMode = .scaleToFill
        self.circleView = circleView
        addSubview(self.circleView)
    }
    
    private func setupBalanceValueLabel() {
        let balanceValueLabel = UILabel()
        balanceValueLabel.font = UIFont.systemFont(ofSize: 24)
        balanceValueLabel.textColor = UIColor(named: "DefaultText")
        balanceValueLabel.text = "20,600"
        self.balanceValueLabel = balanceValueLabel
        addSubview(self.balanceValueLabel)
    }
    
    private func setupCurrentBalanceLabel() {
        let currentBalanceLabel = UILabel()
        currentBalanceLabel.font = UIFont.systemFont(ofSize: 12)
        currentBalanceLabel.textColor = UIColor(named: "DefaultGray")
        currentBalanceLabel.text = "Current balance"
        self.currentBalanceLabel = currentBalanceLabel
        addSubview(self.currentBalanceLabel)
    }
    
    //MARK: Snapkit
    
    private func setupConstraints(){
        
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
