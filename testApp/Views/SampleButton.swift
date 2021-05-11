//
//  SampleButton.swift
//  testApp
//
//  Created by kkerors on 04.05.2021.
//

import Foundation
import SnapKit

class SampleButton: UIButton {
    
    weak var mainLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup(){
        let mainLabel = UILabel()
        self.mainLabel = mainLabel
        addSubview(self.mainLabel)
        setupConstraints()
    }
    
    //MARK: Snapkit
    
    private func setupConstraints(){
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
