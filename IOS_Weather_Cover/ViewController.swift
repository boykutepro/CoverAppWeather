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
        label.font = .systemFont(ofSize: 18)
        
        return label
    } ()
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .brown
        view.bounces = false
        layout.scrollDirection = .horizontal
        //view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
        return view
    } ()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.bounces = false
        view.register(UINib(nibName: "TableViewCell", bundle: .main), forCellReuseIdentifier: "cell")

        return view
    } ()
    
    var times: [Day] = []
    var days: [Week] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
        
        setupData()
        
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
        

        //CollectionView
        containerView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 400).isActive = true
        collectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        //DayLabel
        containerView.addSubview(dayLabel)
        dayLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -10).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: collectionView.leftAnchor, constant: 14).isActive = true
        
        //TableView
        containerView.addSubview(tableView)
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
        
        

    }
    func setupData() {
        let time1 = Day(time: "NOW", icon: "icon_cloudy", temp: "18°")
        let time2 = Day(time: "21", icon: "icon_rain", temp: "25°")
        let time3 = Day(time: "22", icon: "icon_cloudy", temp: "26°")
        let time4 = Day(time: "23", icon: "icons_sun", temp: "28°")
        let time5 = Day(time: "24", icon: "icon_rain", temp: "19°")
        let time6 = Day(time: "00", icon: "icon_rain", temp: "15°")
        let time7 = Day(time: "01", icon: "icon_cloudy", temp: "14°")
        times = [time1, time2, time3, time4, time5, time6, time7, time1, time2, time3, time4]
        
        let day1 = Week(day: "Thứ Bảy", icon: "icons_sun", highestTemp: "26°", lowestTemp: "13°")
        let day2 = Week(day: "Chủ Nhật", icon: "icon_rain", highestTemp: "28°", lowestTemp: "15°")
        let day3 = Week(day: "Thứ Hai", icon: "icon_cloudy", highestTemp: "24°", lowestTemp: "17°")
        let day4 = Week(day: "Thứ Ba", icon: "icons_sun", highestTemp: "21°", lowestTemp: "11°")
        let day5 = Week(day: "Thứ Tư", icon: "icon_rain", highestTemp: "23°", lowestTemp: "17°")
        let day6 = Week(day: "Thứ Năm", icon: "icon_rain", highestTemp: "25°", lowestTemp: "18°")
        let day7 = Week(day: "Thứ Sáu", icon: "icon_cloudy", highestTemp: "28°", lowestTemp: "13°")
        days = [day1, day2, day3, day4, day5, day6, day7, day1, day2, day3, day4, day5, day6, day7]
        
        
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.dayLabel.text = days[indexPath.row].day
        cell.sttIcon.image = UIImage(named: days[indexPath.row].icon)
        cell.highestTemp.text = days[indexPath.row].highestTemp
        cell.lowTemp.text = days[indexPath.row].lowestTemp
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return times.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.timeLabel.text = times[indexPath.row].time
        cell.sttIcon.image = UIImage(named: times[indexPath.row].icon)
        cell.tempLabel.text = times[indexPath.row].temp
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.bounds.height
        return CGSize(width: height*0.4, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

