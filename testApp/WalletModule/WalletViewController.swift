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
    
    private weak var scrollView: UIScrollView!
    
    private weak var logoImageView: UIImageView!
    private weak var companyLabel: UILabel!
    private weak var menuImageView: UIImageView!
    private weak var accountOverviewLabel: UILabel!
    private weak var currentBalanceView: CurrentBalanceView!
    private weak var sendMoneyLabel: UILabel!
    private weak var scanImageView: UIImageView!
    private weak var servicesLabel: UILabel!
    private weak var settingImageView: UIImageView!
    
    private weak var personsCollectionView: UICollectionView!
    private weak var servicesCollectionView: UICollectionView!
    
    private var personArray: [Person] = []
    private var serviceArray: [Service] = []
    
    private var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        walletPresenter.attachView(self)
        
        fillInPersons()
        fillInServices()
        
        setupViews()
        setupConstraints()
        
    }
    
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onViewTapped))
        self.scrollView.addGestureRecognizer(tap)
    }
    
    @objc func onViewTapped() {
        if isMenuOpen {
            isMenuOpen = !isMenuOpen
            delegate?.toggleMenu()
        }
    }
    
    private func fillInPersons() {
        let mike = Person(name: "Mike", image: UIImage(named: "Mike"))
        let joshpeh = Person(name: "Joshpeh", image: UIImage(named: "Joshpeh"))
        personArray.append(mike)
        personArray.append(joshpeh)
    }
    
    private func fillInServices() {
        
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
    
    private func setupViews() {
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
    
    private func setupScrollView() {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollView.contentSize = self.view.frame.size
        view.backgroundColor = .clear
        self.scrollView = scrollView
        view.addSubview(self.scrollView)
        addTap()
        
    }
    
    private func setupMainView() {
        scrollView.backgroundColor = UIColor(named: "DefaultBackground")
    }
    
    private func setupLogoImageView() {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "MainLogo")
        logoImageView.contentMode = .scaleToFill
        self.logoImageView = logoImageView
        scrollView.addSubview(self.logoImageView)
    }
    
    private func setupCompanyLabel() {
        let companyLabel = UILabel()
        companyLabel.text = "eWalle"
        companyLabel.font = UIFont.systemFont(ofSize: 28)
        companyLabel.textColor = UIColor(named: "DefaultText")
        self.companyLabel = companyLabel
        scrollView.addSubview(self.companyLabel)
    }
    
    private func setupMenuImageView() {
        let menuImageView = UIImageView()
        menuImageView.image = UIImage(named: "Union")
        menuImageView.contentMode = .scaleToFill
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(menuTapped))
        menuImageView.addGestureRecognizer(menuTap)
        menuImageView.isUserInteractionEnabled = true
        self.menuImageView = menuImageView
        scrollView.addSubview(self.menuImageView)
    }
    
    @objc func menuTapped() {
        isMenuOpen = !isMenuOpen
        delegate?.toggleMenu()
    }
    
    private func setupAccountOverviewLabel() {
        let accountOverviewLabel = UILabel()
        accountOverviewLabel.text = "Account Overview"
        accountOverviewLabel.textColor = UIColor(named: "HeaderColor")
        accountOverviewLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.accountOverviewLabel = accountOverviewLabel
        scrollView.addSubview(self.accountOverviewLabel)
    }
    
    private func setupCurrentBalanceView() {
        let currentBalanceView = CurrentBalanceView()
        currentBalanceView.backgroundColor = UIColor(named: "BackgroundGray")
        currentBalanceView.layer.cornerRadius = 10
        self.currentBalanceView = currentBalanceView
        scrollView.addSubview(self.currentBalanceView)
    }
    
    private func setupSendMoneyLabel() {
        let sendMoneyLabel = UILabel()
        sendMoneyLabel.text = "Send Money"
        sendMoneyLabel.textColor = UIColor(named: "HeaderColor")
        sendMoneyLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.sendMoneyLabel = sendMoneyLabel
        scrollView.addSubview(self.sendMoneyLabel)
    }
    
    private func setupScanImageView() {
        let scanImageView = UIImageView()
        scanImageView.image = UIImage(named: "Scan")
        scanImageView.contentMode = .scaleToFill
        self.scanImageView = scanImageView
        scrollView.addSubview(self.scanImageView)
    }
    
    private func setupPersonsCollectionView() {
        let personsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        personsCollectionView.delegate = self
        personsCollectionView.dataSource = self
        personsCollectionView.isPagingEnabled = true
        personsCollectionView.backgroundColor = UIColor(named: "DefaultBackground")
        personsCollectionView.showsHorizontalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        personsCollectionView.collectionViewLayout = layout
        
        
        let personCollectionViewCell = UINib(nibName: "PersonCollectionViewCell",
                                      bundle: nil)
        
        personsCollectionView.register(personCollectionViewCell, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        self.personsCollectionView = personsCollectionView
        scrollView.addSubview(self.personsCollectionView)
    }
    
    private func setupServicesLabel() {
        let servicesLabel = UILabel()
        servicesLabel.text = "Services"
        servicesLabel.textColor = UIColor(named: "HeaderColor")
        servicesLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.servicesLabel = servicesLabel
        scrollView.addSubview(self.servicesLabel)
    }
    
    private func setupSettingImageView() {
        let settingImageView = UIImageView()
        settingImageView.image = UIImage(named: "Setting")
        settingImageView.contentMode = .scaleToFill
        self.settingImageView = settingImageView
        scrollView.addSubview(self.settingImageView)
    }
    
    private func setupServicesCollectionView() {
        let servicesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self
        servicesCollectionView.isPagingEnabled = false
        servicesCollectionView.backgroundColor = UIColor(named: "DefaultBackground")
        servicesCollectionView.showsVerticalScrollIndicator = false
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        servicesCollectionView.collectionViewLayout = layout
        
        
        let serviceCollectionViewCell = UINib(nibName: "ServiceCollectionViewCell",
                                      bundle: nil)
        
        servicesCollectionView.register(serviceCollectionViewCell, forCellWithReuseIdentifier: "ServiceCollectionViewCell")
        self.servicesCollectionView = servicesCollectionView
        scrollView.addSubview(self.servicesCollectionView)
    }
    
    //MARK: Snapkit
    
    private func setupConstraints() {
        
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

