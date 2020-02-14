//
//  CollectionViewCell.swift
//  IOS_Weather_Cover
//
//  Created by Thien Tung on 2/14/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NOW"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    } ()
    
    let sttIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "icons_sun")
        
        return image
    } ()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    } ()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupLayout()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupLayout() {
        // ContainerView
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        // Icon
        containerView.addSubview(sttIcon)
        sttIcon.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        sttIcon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        sttIcon.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.3).isActive = true
        sttIcon.widthAnchor.constraint(equalTo: sttIcon.heightAnchor, multiplier: 1).isActive = true
        
        //  TimeLabel
        containerView.addSubview(timeLabel)
        timeLabel.bottomAnchor.constraint(equalTo: sttIcon.topAnchor, constant: -4).isActive = true
        timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        
        //Temp Label
        containerView.addSubview(tempLabel)
        tempLabel.topAnchor.constraint(equalTo: sttIcon.bottomAnchor, constant: 4).isActive = true
        tempLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tempLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
}
