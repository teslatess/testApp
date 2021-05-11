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

    private weak var personView: PersonView!
    
    private weak var cancelImageView: UIImageView!
    
    private weak var menuTableView: UITableView!
    
    private weak var logoutView: LogoutView!
    private weak var versionLabel: UILabel!
    
    private var menuArray: [String?] = []
    
    override func viewDidLoad() {
        
        fillInMenuArray()
        
        setupViews()
        setupConstraints()
        
    }
    
    private func fillInMenuArray() {
        menuArray.append("Home")
        menuArray.append("Profile")
        menuArray.append("Accounts")
        menuArray.append("Transactions")
        menuArray.append("Stats")
        menuArray.append("Settings")
        menuArray.append("Help")
    }
    
    private func setupViews() {
        setupMainView()
        setupPersonView()
        setupCancelImageView()
        setupMenuTableView()
        setupLogoutView()
        setupVersionLabel()
    }
    
    private func setupMainView() {
        view.backgroundColor = UIColor(named: "BackgroundGray")
    }
    
    private func setupPersonView() {
        let personView = PersonView()
        self.personView = personView
        view.addSubview(self.personView)
    }
    
    private func setupCancelImageView() {
        let cancelImageView = UIImageView()
        cancelImageView.image = UIImage(named: "Cancel")
        cancelImageView.contentMode = .scaleToFill
        let tap = UITapGestureRecognizer(target: self, action: #selector(onCancelTapped))
        cancelImageView.addGestureRecognizer(tap)
        cancelImageView.isUserInteractionEnabled = true
        self.cancelImageView = cancelImageView
        view.addSubview(self.cancelImageView)
    }
    
    @objc func onCancelTapped() {
        delegate?.hideMenu()
    }
    
    private func setupMenuTableView() {
        let menuTableView = UITableView()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        menuTableView.separatorStyle = .none
        menuTableView.isScrollEnabled = false
        menuTableView.showsVerticalScrollIndicator = false
        self.menuTableView = menuTableView
        view.addSubview(self.menuTableView)
    }
    
    private func setupLogoutView() {
        let logoutView = LogoutView()
        self.logoutView = logoutView
        view.addSubview(self.logoutView)
    }
    
    private func setupVersionLabel() {
        let versionLabel = UILabel()
        versionLabel.text = "Version 2.0.1"
        versionLabel.textColor = UIColor(named: "HeaderColor")
        versionLabel.font = UIFont.systemFont(ofSize: 10)
        self.versionLabel = versionLabel
        view.addSubview(self.versionLabel)
    }
    
    //MARK: Snapkit
    
    private func setupConstraints() {
        
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
