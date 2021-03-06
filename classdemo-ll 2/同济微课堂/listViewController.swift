//
//  listViewController.swift
//  同济微课堂
//
//  Created by mac on 2017/8/24.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit

class listViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private let kScreenWidth = UIScreen.main.bounds.size.width
    private var table: UITableView!    
    
    override func viewDidLoad() {
        title = "列表"
        self.view.backgroundColor = UIColor.white
        initTableView()
    }
    
    //display tableView
    func initTableView() {
        let y = (self.navigationController?.navigationBar.bounds.height)! + 10
        let height = self.view.bounds.height - y
        table = UITableView(frame: CGRect(x: 10, y: y, width: kScreenWidth-20, height: height))

        table.layer.cornerRadius = 10
        
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }
    
    //tableView protocal
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier="Cells";
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        
        //image
        let cellImg = UIImageView(frame: CGRect(x: 20, y: 20, width: (kScreenWidth-60), height: self.view.bounds.height*0.25))
        cellImg.layer.shadowOffset = CGSize(width: 0, height: 3)
        cellImg.layer.shadowColor = UIColor.lightGray.cgColor
        cellImg.layer.shadowOpacity = 0.8
        cellImg.layer.shadowRadius = 8
        
        cellImg.layer.cornerRadius = 6
        cellImg.layer.masksToBounds = true
        
        cellImg.image = UIImage(named: "test")
        
        //mainTitle
        let mainTitle = UILabel(frame: CGRect(x: cell.center.x - 10, y: 40, width: (kScreenWidth-100), height: self.view.bounds.height*0.1))
        mainTitle.text = "软件学院"
        mainTitle.textColor = UIColor.darkGray
        mainTitle.font = UIFont.systemFont(ofSize: 28, weight: .thin)
        
        
        cell.addSubview(cellImg)
        cell.addSubview(mainTitle)
        
        cell.accessoryType = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height*0.3
    }
    
    
}
