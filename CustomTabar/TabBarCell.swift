//
//  TabBarCell.swift
//  CustomTabar
//
//  Created by Huy Than Duc on 11/12/2020.
//

import UIKit

class TabBarCell: UICollectionViewCell {
    static let identification = "TabBarCell"
    var topConstrant : NSLayoutConstraint?
    lazy var imageView = UIImageView()
    lazy var title = UILabel()
    var content = UIView()
    var bg = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBgView()
        setUpContentView()
    }
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                self.activeElement()
            } else {
                self.inActiveElement()
            }
        }
    }
    func activeElement() {
        self.topConstrant?.constant = -(content.bounds.width/2)
        animation {
            self.content.layer.cornerRadius = self.content.bounds.width/2
            self.content.backgroundColor = .white
            self.imageView.tintColor = .red
            self.title.textColor = .red
        }
    }
    func inActiveElement() {
        content.layer.cornerRadius = content.bounds.width/2
        animation {
            self.content.layer.cornerRadius = 0
            self.content.backgroundColor = .clear
            self.topConstrant?.constant = 5
            self.imageView.tintColor = .white
            self.title.textColor = .white
        }
    }
    func animation(competion: @escaping ()->Void) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self!.layoutIfNeeded()
            competion()
        }
    }
    func setUpBgView() {
        bg.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bg)
        NSLayoutConstraint.activate([
            bg.heightAnchor.constraint(equalToConstant: bounds.height),
            bg.widthAnchor.constraint(equalToConstant: bounds.width+1)
        ])
        if let color = UIColor(named: "red") {
            bg.backgroundColor = color
        }
    }
    func setUpContentView() {
        content.translatesAutoresizingMaskIntoConstraints = false
        topConstrant = content.topAnchor.constraint(equalTo: topAnchor,constant: 5)
        bg.addSubview(content)
        NSLayoutConstraint.activate([
            content.heightAnchor.constraint(equalToConstant: bounds.width),
            content.widthAnchor.constraint(equalToConstant: bounds.width)
        ])
        topConstrant?.isActive = true
        setUpImageView()
        setUpTitle()
    }
    func setUpImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(imageView)
        imageView.tintColor = .white
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.topAnchor.constraint(equalTo: content.topAnchor,constant: 5),
            imageView.centerXAnchor.constraint(equalTo: content.centerXAnchor)
        ])
    }
    func setUpTitle() {
        title.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(title)
        title.font = .boldSystemFont(ofSize: 10)
        title.textAlignment = .center
        title.textColor = .white
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: content.trailingAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
