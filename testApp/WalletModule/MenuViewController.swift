//
//  MenuViewController.swift
//  testApp
//
//  Created by kkerors on 09.05.2021.
//

import Foundation
import UIKit

protocol MenuViewControllerDelegate {
    func hideMenu()
}

class MenuViewController: UIViewController {
    
    var delegate: MenuViewControllerDelegate?
    
    //MARK: UIViews

    let personView = PersonView()
    
    let cancelImageView = UIImageView()
    
    let menuTableView = UITableView()
    
    let logoutView = LogoutView()
    let versionLabel = UILabel()
    
    var menuArray: [String?] = []
    
    override func viewDidLoad() {
        
        view.addSubview(personView)
        view.addSubview(cancelImageView)
        view.addSubview(menuTableView)
        view.addSubview(logoutView)
        view.addSubview(versionLabel)
        
        fillInMenuArray()
        
        setupViews()
        setupConstraints()
        
    }
    
    func fillInMenuArray() {
        menuArray.append("Home")
        menuArray.append("Profile")
        menuArray.append("Accounts")
        menuArray.append("Transactions")
        menuArray.append("Stats")
        menuArray.append("Settings")
        menuArray.append("Help")
    }
    
    func setupViews() {
        setupMainView()
        setupCancelImageView()
        setupMenuTableView()
        setupVersionLabel()
    }
    
    func setupMainView() {
        view.backgroundColor = UIColor(named: "BackgroundGray")
    }
    
    func setupCancelImageView() {
        cancelImageView.image = UIImage(named: "Cancel")
        cancelImageView.contentMode = .scaleToFill
        let tap = UITapGestureRecognizer(target: self, action: #selector(onCancelTapped))
        cancelImageView.addGestureRecognizer(tap)
        cancelImageView.isUserInteractionEnabled = true
    }
    
    @objc func onCancelTapped() {
        delegate?.hideMenu()
    }
    
    func setupMenuTableView() {
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        menuTableView.separatorStyle = .none
        menuTableView.isScrollEnabled = false
        menuTableView.showsVerticalScrollIndicator = false
    }
    
    func setupVersionLabel() {
        versionLabel.text = "Version 2.0.1"
        versionLabel.textColor = UIColor(named: "HeaderColor")
        versionLabel.font = UIFont.systemFont(ofSize: 10)
    }
    
    //MARK: Snapkit
    
    func setupConstraints() {
        
        personView.snp.makeConstraints {
            $0.height.equalTo(view.frame.height/6)
            $0.width.equalTo(view.frame.width/1.7)
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        cancelImageView.snp.makeConstraints {
            $0.top.equalTo(view).offset(topBarHeight)
            $0.right.equalTo(view).offset(-27)
            $0.width.equalTo(15)
            $0.height.equalTo(15)
        }
        
        menuTableView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(30)
            $0.top.equalTo(view.frame.height/5)
            $0.width.equalTo(view.frame.width/2)
            $0.bottom.equalTo(logoutView.snp.top).offset(-20)
        }
        
        versionLabel.snp.makeConstraints {
            $0.bottom.equalTo(view).offset(-27)
            $0.left.equalTo(view).offset(30)
        }
        
        logoutView.snp.makeConstraints {
            $0.bottom.equalTo(versionLabel.snp.top).offset(-65)
            $0.left.equalTo(versionLabel)
            $0.right.equalToSuperview()
        }
    }
    
}

//MARK: UITableViewDelegate, UITableViewDataSource

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = menuArray[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = UIColor(named: "DefaultText")
        cell.selectionStyle = .none
        cell.textLabel?.contentMode = .left
        return cell
    }
    
}
