//
//  ViewController.swift
//  IOS_Weather_Cover
//
//  Created by Thien Tung on 2/14/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()
    
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Thoitiet")
        image.contentMode = .scaleAspectFill
        
        return image
    } ()

    let adrLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hà Nội"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 42)
        
        return label
    } ()
    
    let sttLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Trời nhiều mây"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        
        return label
    } ()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "24"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 100, weight: .thin)
        
        return label
    } ()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hôm nay"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        
        return label
    } ()
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        view.bounces = false
        layout.scrollDirection = .vertical
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return view
    } ()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.bounces = false

        return view
    } ()
    
    var time: [day] = []
    var day: [week] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
    func setupLayout() {
        
        // ContainerView
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // Background
        containerView.addSubview(imageBackground)
        imageBackground.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        imageBackground.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        imageBackground.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        imageBackground.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        // Adress Label
        imageBackground.addSubview(adrLabel)
        adrLabel.topAnchor.constraint(equalTo: imageBackground.topAnchor, constant: 98).isActive = true
        adrLabel.centerXAnchor.constraint(equalTo: imageBackground.centerXAnchor, constant: 0).isActive = true
        
        //STT Label
        imageBackground.addSubview(sttLabel)
        sttLabel.topAnchor.constraint(equalTo: adrLabel.bottomAnchor, constant: 8).isActive = true
        sttLabel.centerXAnchor.constraint(equalTo: adrLabel.centerXAnchor, constant: 0).isActive = true
        
        //Temp Label
        imageBackground.addSubview(tempLabel)
        tempLabel.topAnchor.constraint(equalTo: sttLabel.bottomAnchor, constant: 18).isActive = true
        tempLabel.centerXAnchor.constraint(equalTo: sttLabel.centerXAnchor, constant: 0).isActive = true

        
        //TableView
        imageBackground.addSubview(tableView)
        tableView.bottomAnchor.constraint(equalTo: imageBackground.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalTo: imageBackground.heightAnchor, multiplier: 0.4).isActive = true
        
        //CollectionView
        imageBackground.addSubview(collectionView)
        collectionView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: imageBackground.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: tableView.heightAnchor, multiplier: 0.4).isActive = true
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
//        }
    }
    func setupData() {
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.bounds.height
        return CGSize(width: height*0.4, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

