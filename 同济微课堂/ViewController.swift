//
//  ViewController.swift
//  同济微课堂
//
//  Created by mac on 2017/8/24.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ViewController: UITabBarController, SlideMenuControllerDelegate {
    
    private let nameArr = ["主页","列表","我的"]
    private let picArr = ["home","列表","我的"]
    private let selectedPicArr = ["home_selected","selected_home","mine_selected"]
    
//    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet var item0: UITabBarItem!
    @IBOutlet var item1: UITabBarItem!
    @IBOutlet var item2: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 143/255, blue: 247/255, alpha: 1)
        self.title = "同济微课堂"
        //NSAttributedStringKey.foregroundColor:UIColor.white, 
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Heiti SC", size: 18.0)!]
        
        initTabBar()
        self.view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(openSideMenu)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initSideMenu()
        UIApplication.shared.keyWindow?.rootViewController = AppDelegate.slideMenuController
    }
    
    func initTabBar(){
        let homeView = homeViewController()
        homeView.tabBarItem.title = nameArr[0]
        homeView.tabBarItem.image = UIImage(named: picArr[0])
        homeView.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Heiti SC", size: 11.0)!], for: .normal)
        
        let listView = listViewController()
        listView.tabBarItem.title = nameArr[1]
        listView.tabBarItem.image = UIImage(named: picArr[1])
        listView.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Heiti SC", size: 11.0)!], for: .normal)
        
        
        self.selectedIndex = 0
        self.viewControllers = [homeView, listView]
        self.view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(openSideMenu)))
        self.navigationController?.navigationBar.tintColor = UIColor(red: 64/255.0, green: 64/255.0, blue: 64/255.0, alpha: 1)
    }

    func initSideMenu() {
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "目录.png")!, style: UIBarButtonItemStyle.plain, target: self, action: #selector(openSideMenu))
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.closeLeft()
    }
    
    @objc func openSideMenu() {
        self.slideMenuController()?.openLeft()
    }

}

