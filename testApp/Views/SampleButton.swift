//
//  SampleButton.swift
//  testApp
//
//  Created by kkerors on 04.05.2021.
//

import Foundation
import SnapKit

class SampleButton: UIButton {
    
    let mainLabel = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialSetup(){
        addSubview(mainLabel)
        setupConstraints()
    }
    
    //MARK: Snapkit
    
    func setupConstraints(){
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
