//
//  LoginViewController.swift
//  testApp
//
//  Created by kkerors on 04.05.2021.
//

import Foundation
import SnapKit

class LoginViewContoller: UIViewController {
    
    //MARK: UIViews
    
    private weak var mainView: UIView!
    private weak var timeLabel: UILabel!
    private weak var weatherLabel: UILabel!
    private weak var dateLabel: UILabel!
    private weak var leftSideImageView: UIImageView!
    private weak var cloudImageView: UIImageView!
    private weak var logoImageView: UIImageView!
    private weak var companyLabel: UILabel!
    private weak var descriptionLabel: UILabel!
    private weak var signInButton: SampleButton!
    private weak var creationButton: UIButton!
    
    fileprivate let loginPresenter = LoginPresenter(loginService: LoginService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPresenter.attachView(self)
        setupViews()
        setupConstraints()
        
    }
    
    private func setupViews() {
        setupMainView()
        setupLeftSideImageView()
        setupTimeLabel()
        setupCloudImageView()
        setupWeatherLabel()
        setupDateLabel()
        setupLogoImageView()
        setupCompanyLabel()
        setupDescriptionLabel()
        setupSignInButton()
        setupCreationButton()
    }
    
    private func setupMainView() {
        let mainView = UIView()
        mainView.backgroundColor = UIColor(named: "DefaultBackground")
        self.mainView = mainView
        view.addSubview(self.mainView)
    }
    
    private func setupLeftSideImageView() {
        let leftSideImageView = UIImageView()
        leftSideImageView.image = UIImage(named: "LeftSideImage")
        leftSideImageView.contentMode = .scaleAspectFill
        leftSideImageView.backgroundColor = .black
        leftSideImageView.clipsToBounds = true
        leftSideImageView.setNeedsLayout()
        self.leftSideImageView = leftSideImageView
        mainView.addSubview(self.leftSideImageView)
    }
    
    private func setupTimeLabel() {
        let timeLabel = UILabel()
        timeLabel.text = "06:20 PM"
        timeLabel.textColor = UIColor(named: "DefaultText")
        
        if UIDevice.modelName == "iPhone SE" {
            timeLabel.font = UIFont.systemFont(ofSize: 20)
        } else {
            timeLabel.font = UIFont.systemFont(ofSize: 24)
        }
        self.timeLabel = timeLabel
        mainView.addSubview(self.timeLabel)
        
    }
    
    private func setupCloudImageView() {
        let cloudImageView = UIImageView()
        cloudImageView.image = UIImage(named: "Cloud")
        cloudImageView.contentMode = .scaleToFill
        self.cloudImageView = cloudImageView
        mainView.addSubview(self.cloudImageView)
        
    }
    
    private func setupWeatherLabel() {
        let weatherLabel = UILabel()
        weatherLabel.text = "34° C"
        weatherLabel.textColor = UIColor(named: "DefaultText")
        weatherLabel.font = UIFont.systemFont(ofSize: 13)
        self.weatherLabel = weatherLabel
        mainView.addSubview(self.weatherLabel)
    }
    
    private func setupDateLabel() {
        let dateLabel = UILabel()
        dateLabel.text = "Nov.10.2020 | Wednesday"
        dateLabel.textColor = UIColor(named: "DefaultGray")
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        self.dateLabel = dateLabel
        mainView.addSubview(self.dateLabel)
    }
    
    private func setupLogoImageView() {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "MainLogo")
        logoImageView.contentMode = .scaleToFill
        self.logoImageView = logoImageView
        mainView.addSubview(self.logoImageView)
    }
    
    private func setupCompanyLabel() {
        let companyLabel = UILabel()
        companyLabel.text = "eWalle"
        companyLabel.font = UIFont.systemFont(ofSize: 28)
        companyLabel.textColor = UIColor(named: "DefaultText")
        self.companyLabel = companyLabel
        mainView.addSubview(self.companyLabel)
    }
    
    private func setupDescriptionLabel() {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Open An Account For Digital E-Wallet Solutions.Instant Payouts. \n\n Join For Free"
        descriptionLabel.textColor = UIColor(named: "DefaultGray")
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel = descriptionLabel
        mainView.addSubview(self.descriptionLabel)
    }
    
    private func setupSignInButton() {
        let signInButton = SampleButton()
        signInButton.mainLabel.text = "Sign in"
        signInButton.mainLabel.textColor = .black
        signInButton.backgroundColor = UIColor.init(named: "DefaultOrange")
        signInButton.layer.cornerRadius = 10
        signInButton.layer.masksToBounds = true
        signInButton.mainLabel.font = UIFont.boldSystemFont(ofSize: 16)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        self.signInButton = signInButton
        mainView.addSubview(self.signInButton)
    }
    
    @objc func signInButtonTapped() {
        loginPresenter.pushButtonPressed(self)
    }
    
    private func setupCreationButton() {
        let creationButton = UIButton()
        creationButton.setTitle("Create an account", for: .normal)
        creationButton.setTitleColor(UIColor(named: "DefaultText"), for: .normal)
        creationButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        creationButton.addTarget(self, action: #selector(creationButtonTapped), for: .touchUpInside)
        self.creationButton = creationButton
        mainView.addSubview(self.creationButton)
    }
    
    @objc func creationButtonTapped() {
        loginPresenter.pushButtonPressed(self)
    }
    
    //MARK: Snapkit
        
    private func setupConstraints() {
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        leftSideImageView.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.top)
            $0.left.equalTo(mainView.snp.left)
            $0.width.equalTo(view.frame.width/3)
            $0.bottom.equalTo(mainView.snp.bottom)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.top).offset(topBarHeight)
            $0.left.equalTo(leftSideImageView.snp.right).offset(26)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.right.equalTo(mainView.snp.right).offset(-29)
            $0.centerY.equalTo(timeLabel.snp.centerY)
        }
        
        cloudImageView.snp.makeConstraints {
            $0.right.equalTo(weatherLabel.snp.left).offset(-8)
            $0.centerY.equalTo(timeLabel.snp.centerY)
            $0.height.equalTo(13)
            $0.width.equalTo(18)
        }
        
        dateLabel.snp.makeConstraints {
            $0.left.equalTo(leftSideImageView.snp.right).offset(26)
            $0.top.equalTo(timeLabel.snp.bottom).offset(7)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(mainView.snp.centerY)
            $0.left.equalTo(leftSideImageView.snp.right).offset(26)
            $0.right.equalTo(mainView.snp.right).offset(-26)
        }
        
        companyLabel.snp.makeConstraints {
            $0.left.equalTo(leftSideImageView.snp.right).offset(26)
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-16)
        }
        
        logoImageView.snp.makeConstraints {
            $0.bottom.equalTo(companyLabel.snp.top).offset(-17)
            $0.left.equalTo(leftSideImageView.snp.right).offset(26)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
        }
        
        creationButton.snp.makeConstraints {
            $0.bottom.equalTo(mainView.snp.bottom).offset(-53)
            $0.centerX.equalTo(signInButton.snp.centerX)
        }
        
        signInButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.left.equalTo(leftSideImageView.snp.right).offset(26)
            $0.bottom.equalTo(creationButton.snp.top).offset(-29)
            $0.right.equalTo(mainView.snp.right).offset(-26)
        }
    }
    
}

extension LoginViewContoller: LoginView {
    
    func startLoading() {
        mainView.isHidden = false
    }
    
    func finishLoading() {
        mainView.isHidden = true
    }
}

extension UIViewController {
        
    var topBarHeight: CGFloat {
            
    if UIDevice.modelName == "iPhone SE" {
                return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                    (self.navigationController?.navigationBar.frame.height ?? 30)
            } else {
                return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                    (self.navigationController?.navigationBar.frame.height ?? 30) + 30
            }
        }
}
