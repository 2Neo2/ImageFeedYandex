//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Иван Доронин on 02.11.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    private lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "profile_image")
        return image
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 23)
        label.text = "Екатерина Новикова"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "@ekaterina_nov"
        label.textColor = Constants.Colors.profileEmailColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, world!"
        label.font = .italicSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "logout"), for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        inserViews()
        layoutView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "YPBlack")
        
    }
    
    private func layoutView() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func inserViews() {
        view.addSubview(profileImage)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(userInfoLabel)
        view.addSubview(logoutButton)
    }
}
