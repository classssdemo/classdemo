//
//  sideMenuViewController.swift
//  同济微课堂
//
//  Created by Lin on 2017/11/7.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class sideMenuViewController: SlideMenuController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CELL")
        cell.textLabel?.textColor = UIColor(red: 64/255.0, green: 64/255.0, blue: 64/255.0, alpha: 1)
        cell.textLabel?.text = titles[indexPath.row]
        cell.imageView?.image = UIImage(named: picNames[indexPath.row])
        
        //调整图片大小
        let size = CGSize(width: 20, height: 20)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        cell.imageView?.image?.draw(in: imageRect)
        cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    var topBG = UIImageView(frame: CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: 0.25 * UIScreen.main.bounds.height))
    
    var avatar = UIImageView.init(frame: CGRect(x: 0.08 * UIScreen.main.bounds.width, y: 0.1 * UIScreen.main.bounds.height, width: 50, height: 50))
    
    var usrname = UILabel(frame: CGRect(x: 0.3 * UIScreen.main.bounds.width, y: 0.1 * UIScreen.main.bounds.height, width: 0.7 * UIScreen.main.bounds.width, height: 50))
    
    var selfIntro =  UILabel(frame: CGRect(x: 0.08 * UIScreen.main.bounds.width, y: 0.18 * UIScreen.main.bounds.height, width: 0.9 * UIScreen.main.bounds.width, height: 30))
    
    var tableview = UITableView.init(frame: CGRect(x: 0, y: 0.25 * UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 0.75 * UIScreen.main.bounds.height))
    
    let titles = ["    我的主页", "    我的关注", "    我的粉丝", "    设置"]
    let picNames = ["主页.png", "关注.png", "粉丝.png", "设置.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBG()
        initTableview()
        // Do any additional setup after loading the view.
        
        //设置导航栏透明
        // 3.设置导航栏半透明
        self.navigationController?.navigationBar.isTranslucent = true
        // 4.设置导航栏背景图片
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        // 5.设置导航栏阴影图片
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initBG() {
        topBG.image = UIImage(named: "topBG.png")
        self.view.addSubview(topBG)
        
        avatar.image = UIImage(named: "头像.png")
        self.view.addSubview(avatar)
        
        usrname.font = UIFont.systemFont(ofSize: 40)
        usrname.textColor = UIColor.white
        usrname.text = "Derek"
        self.view.addSubview(usrname)
        
        selfIntro.font = UIFont.systemFont(ofSize: 15)
        selfIntro.textColor = UIColor.white
        selfIntro.text = "自强不息，厚德载物。"
        self.view.addSubview(selfIntro)
    }
    
    func initTableview() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.separatorStyle = .none
        tableview.tableFooterView = UIView()
        self.view.addSubview(tableview)
    }
    
    
    
}
