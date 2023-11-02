//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Иван Доронин on 29.10.2023.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    private var isActive: Bool = false
    
    private lazy var imageContent: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "0")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    private lazy var labelDate: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(ImagesListCell.self, action: #selector(buttonTapHandler), for: .touchUpInside)
        button.setImage(UIImage(named: "active_like"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        layoutView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapHandler() {
        if self.isActive {
            button.setImage(UIImage(named: "active_like"), for: .normal)
        } else {
            button.setImage(UIImage(named: "no_active_like"), for: .normal)
        }
    }
    
    private func setupView() {
        self.contentView.addSubview(imageContent)
        self.contentView.addSubview(labelDate)
        self.contentView.addSubview(button)
        self.backgroundColor = .clear
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 16
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: .init(
            top: 8.0, left: .zero, bottom: 8.0, right: .zero
        ))
    }
    
    func configureCell(for imageName: String, with islike: Bool) {
        guard let image = UIImage(named: imageName) else {
            return
        }
        
        self.isActive = islike
        
        imageContent.image = image
        labelDate.text = dateFormatter.string(from: Date())
    
        button.setImage(islike ? UIImage(named: "active_like") : UIImage(named: "no_active_like"), for: .normal)
        setupView()
        layoutView()
    }
    
    private func layoutView() {
        NSLayoutConstraint.activate([
            imageContent.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            labelDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            labelDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4)
        ])
    }
}
