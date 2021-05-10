//
//  WalletViewController.swift
//  testApp
//
//  Created by kkerors on 06.05.2021.
//

import Foundation
import UIKit
import SnapKit

protocol WalletViewControllerDelegate {
    func toggleMenu()
}

class WalletViewController: UIViewController {
    
    fileprivate let walletPresenter = WalletPresenter(walletService: WalletService())
    
    var delegate: WalletViewControllerDelegate?
    
    //MARK: UIViews
    
    let scrollView = UIScrollView()
    
    let logoImageView = UIImageView()
    let companyLabel = UILabel()
    let menuImageView = UIImageView()
    let accountOverviewLabel = UILabel()
    let currentBalanceView = CurrentBalanceView()
    let sendMoneyLabel = UILabel()
    let scanImageView = UIImageView()
    let servicesLabel = UILabel()
    let settingImageView = UIImageView()
    
    let personsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let servicesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var personArray: [Person] = []
    var serviceArray: [Service] = []
    
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walletPresenter.attachView(self)
        
        view.addSubview(scrollView)

        addTap()
        
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(companyLabel)
        scrollView.addSubview(menuImageView)
        scrollView.addSubview(accountOverviewLabel)
        scrollView.addSubview(currentBalanceView)
        scrollView.addSubview(sendMoneyLabel)
        scrollView.addSubview(scanImageView)
        scrollView.addSubview(personsCollectionView)
        scrollView.addSubview(servicesLabel)
        scrollView.addSubview(settingImageView)
        scrollView.addSubview(servicesCollectionView)
        
        fillInPersons()
        fillInServices()
        
        setupViews()
        setupConstraints()
        
    }
    
    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onViewTapped))
        self.scrollView.addGestureRecognizer(tap)
    }
    
    @objc func onViewTapped() {
        if isMenuOpen {
            isMenuOpen = !isMenuOpen
            delegate?.toggleMenu()
        }
    }
    
    func fillInPersons() {
        let mike = Person(name: "Mike", image: UIImage(named: "Mike"))
        let joshpeh = Person(name: "Joshpeh", image: UIImage(named: "Joshpeh"))
        personArray.append(mike)
        personArray.append(joshpeh)
    }
    
    func fillInServices() {
        
        // Потому что сервисы не реализованы
        
        let sendMoney = Service(name: "Send Money", image: UIImage(named: "Send"))
        let receiveMoney = Service(name: "Receive Money", image: UIImage(named: "Receive"))
        let mobilePrepaid = Service(name: "Mobile Prepaid", image: UIImage(named: "Prepaid"))
        let electricityBill = Service(name: "Electricity Bill", image: UIImage(named: "Bill"))
        let cashbackOffer = Service(name: "Cashback Offer", image: UIImage(named: "Cashback"))
        let movieTickets = Service(name: "Movie Tickets", image: UIImage(named: "Movie"))
        let flightTickets = Service(name: "Flight Tickets", image: UIImage(named: "Flight"))
        let moreOptions = Service(name: "More Options", image: UIImage(named: "Union"))
        serviceArray.append(sendMoney)
        serviceArray.append(receiveMoney)
        serviceArray.append(mobilePrepaid)
        serviceArray.append(electricityBill)
        serviceArray.append(cashbackOffer)
        serviceArray.append(movieTickets)
        serviceArray.append(flightTickets)
        serviceArray.append(moreOptions)
        
    }
    
    func setupViews() {
        setupScrollView()
        setupMainView()
        setupLogoImageView()
        setupCompanyLabel()
        setupMenuImageView()
        setupAccountOverviewLabel()
        setupCurrentBalanceView()
        setupSendMoneyLabel()
        setupScanImageView()
        setupPersonsCollectionView()
        setupServicesCollectionView()
        setupServicesLabel()
        setupSettingImageView()
    }
    
    func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollView.contentSize = self.view.frame.size
        view.backgroundColor = .clear
    }
    
    func setupMainView() {
        scrollView.backgroundColor = UIColor(named: "DefaultBackground")
    }
    
    func setupLogoImageView() {
        logoImageView.image = UIImage(named: "MainLogo")
        logoImageView.contentMode = .scaleToFill
    }
    
    func setupCompanyLabel() {
        companyLabel.text = "eWalle"
        companyLabel.font = UIFont.systemFont(ofSize: 28)
        companyLabel.textColor = UIColor(named: "DefaultText")
    }
    
    func setupMenuImageView() {
        menuImageView.image = UIImage(named: "Union")
        menuImageView.contentMode = .scaleToFill
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(menuTapped))
        menuImageView.addGestureRecognizer(menuTap)
        menuImageView.isUserInteractionEnabled = true
    }
    
    @objc func menuTapped() {
        isMenuOpen = !isMenuOpen
        delegate?.toggleMenu()
    }
    
    func setupAccountOverviewLabel() {
        accountOverviewLabel.text = "Account Overview"
        accountOverviewLabel.textColor = UIColor(named: "HeaderColor")
        accountOverviewLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupCurrentBalanceView() {
        currentBalanceView.backgroundColor = UIColor(named: "BackgroundGray")
        currentBalanceView.layer.cornerRadius = 10
        currentBalanceView.balanceValueLabel.text = "20,600"
        currentBalanceView.currentBalanceLabel.text = "Current balance"
    }
    
    func setupSendMoneyLabel() {
        sendMoneyLabel.text = "Send Money"
        sendMoneyLabel.textColor = UIColor(named: "HeaderColor")
        sendMoneyLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupScanImageView() {
        scanImageView.image = UIImage(named: "Scan")
        scanImageView.contentMode = .scaleToFill
    }
    
    func setupPersonsCollectionView() {
        personsCollectionView.delegate = self
        personsCollectionView.dataSource = self
        personsCollectionView.isPagingEnabled = true
        personsCollectionView.backgroundColor = UIColor(named: "DefaultBackground")
        personsCollectionView.showsHorizontalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.personsCollectionView.collectionViewLayout = layout
        
        
        let personCollectionViewCell = UINib(nibName: "PersonCollectionViewCell",
                                      bundle: nil)
        
        self.personsCollectionView.register(personCollectionViewCell, forCellWithReuseIdentifier: "PersonCollectionViewCell")
    }
    
    func setupServicesLabel() {
        servicesLabel.text = "Services"
        servicesLabel.textColor = UIColor(named: "HeaderColor")
        servicesLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func setupSettingImageView() {
        settingImageView.image = UIImage(named: "Setting")
        settingImageView.contentMode = .scaleToFill
    }
    
    func setupServicesCollectionView() {
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        servicesCollectionView.isPagingEnabled = false
        servicesCollectionView.backgroundColor = UIColor(named: "DefaultBackground")
        servicesCollectionView.showsVerticalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.servicesCollectionView.collectionViewLayout = layout
        
        
        let serviceCollectionViewCell = UINib(nibName: "ServiceCollectionViewCell",
                                      bundle: nil)
        
        self.servicesCollectionView.register(serviceCollectionViewCell, forCellWithReuseIdentifier: "ServiceCollectionViewCell")
    }
    
    //MARK: Snapkit
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top).offset(topBarHeight)
            $0.left.equalTo(scrollView.snp.left).offset(25)
            $0.width.equalTo(47)
            $0.height.equalTo(31)
        }
        
        companyLabel.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.left.equalTo(logoImageView.snp.right).offset(10)
        }
        
        menuImageView.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView.snp.centerY)
            $0.right.equalTo(view.snp.right).offset(-25)
            $0.width.height.equalTo(19)
        }
        
        accountOverviewLabel.snp.makeConstraints {
            $0.left.equalTo(logoImageView.snp.left)
            $0.top.equalTo(logoImageView.snp.bottom).offset(50)
        }
        
        currentBalanceView.snp.makeConstraints {
            $0.top.equalTo(accountOverviewLabel.snp.bottom).offset(20)
            $0.left.equalTo(logoImageView.snp.left)
            $0.right.equalTo(menuImageView.snp.right)
            $0.height.equalTo(100)
        }
        
        sendMoneyLabel.snp.makeConstraints {
            $0.top.equalTo(currentBalanceView.snp.bottom).offset(40)
            $0.left.equalTo(logoImageView.snp.left)
        }
        
        scanImageView.snp.makeConstraints {
            $0.top.equalTo(sendMoneyLabel.snp.top)
            $0.right.equalTo(menuImageView.snp.right)
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        personsCollectionView.snp.makeConstraints {
            $0.left.equalTo(logoImageView.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.top.equalTo(sendMoneyLabel.snp.bottom).offset(20)
            $0.height.equalTo(120)
        }
        
        servicesLabel.snp.makeConstraints {
            $0.top.equalTo(personsCollectionView.snp.bottom).offset(40)
            $0.left.equalTo(logoImageView.snp.left)
        }
        
        settingImageView.snp.makeConstraints {
            $0.top.equalTo(servicesLabel.snp.top)
            $0.right.equalTo(menuImageView.snp.right)
            $0.width.equalTo(24)
            $0.height.equalTo(16)
        }
        
        servicesCollectionView.snp.makeConstraints {
            $0.left.equalTo(logoImageView.snp.left)
            $0.right.equalTo(menuImageView.snp.right)
            $0.top.equalTo(servicesLabel.snp.bottom).offset(20)
            $0.height.equalTo(260)
            $0.bottom.equalToSuperview()
        }
        
    }
}

//MARK: Collection Views Setting

extension WalletViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == personsCollectionView {
            return personArray.count
        }
        
        if collectionView == servicesCollectionView {
            return serviceArray.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == personsCollectionView {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as? PersonCollectionViewCell)!
            cell.fillInPersonCell(person: personArray[indexPath.row])
            return cell
        }
        
        if collectionView == servicesCollectionView {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCell", for: indexPath) as? ServiceCollectionViewCell)!
            cell.fillInServiceCell(service: serviceArray[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
          layout collectionViewLayout: UICollectionViewLayout,
          sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == personsCollectionView {
            return CGSize(width: 100, height: 120)
        }
        
        if collectionView == servicesCollectionView {
            let collectionWidth = collectionView.bounds.width/4.0
            let collectionHeight = collectionWidth*1.4
            return CGSize(width: collectionWidth, height: collectionHeight)
        }
                
        return CGSize(width: 0, height: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == personsCollectionView {
            return 10
        }
        
        if collectionView == servicesCollectionView {
            return 0
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
}

extension WalletViewController: WalletView {
    
    func startLoading() {
        scrollView.isHidden = false
    }
    
    func finishLoading() {
        scrollView.isHidden = true
    }
}

