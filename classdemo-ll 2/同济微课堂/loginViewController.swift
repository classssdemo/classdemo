//
//  loginViewController.swift
//  同济微课堂
//
//  Created by mac on 2017/11/7.
//  Copyright © 2017年 mac. All rights reserved.
//

import SkyFloatingLabelTextField
import UIKit
import Alamofire

class loginViewController: UIViewController {
    private var loginBut:UIButton = UIButton()
    private let studentID = SkyFloatingLabelTextField()
    private let psword = SkyFloatingLabelTextField()
    
    override func viewDidLoad() {
        setBut()
        setBar()
        setTextField()
        
        loginBut.addGestureRecognizer(UITapGestureRecognizer(target:self, action:#selector(loginCheck)))
    }
    
    func setBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setTextField(){
        let logo = UIImageView()
        logo.frame = CGRect(x: self.view.bounds.width*0.1, y: self.view.bounds.height*0.25, width: 300, height: 85)
        logo.image = UIImage(named:"tongji_logo.png")
        self.view.addSubview(logo)
        
        
        let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
        let overcastBlueColor = UIColor(red: 0, green: 143/255, blue: 247/255, alpha: 1.0)
        let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        studentID.frame = CGRect(x:self.view.bounds.width*0.1, y:self.view.bounds.height*0.4, width:self.view.bounds.width*0.8, height:45)
        studentID.placeholder = "学号"
        studentID.title = "学号"
        studentID.textColor = white
        studentID.tintColor = overcastBlueColor // the color of the blinking cursor
        studentID.textColor = white
        studentID.lineColor = darkGreyColor
        studentID.selectedTitleColor = white
        studentID.selectedLineColor = white
        studentID.lineHeight = 1.0 // bottom line height in points
        studentID.selectedLineHeight = 2.0
        self.view.addSubview(studentID)
        
        psword.frame = CGRect(x:self.view.bounds.width*0.1, y:self.view.bounds.height*0.5, width:self.view.bounds.width*0.8, height:45)
        psword.placeholder = "密码"
        psword.title = "密码"
        psword.textColor = white
        
        psword.tintColor = overcastBlueColor // the color of the blinking cursor
        psword.textColor = darkGreyColor
        psword.lineColor = darkGreyColor
        psword.selectedTitleColor = white
        psword.selectedLineColor = white
        
        psword.lineHeight = 1.0 // bottom line height in points
        psword.selectedLineHeight = 2.0
        psword.isSecureTextEntry = true
        
        self.view.addSubview(psword)
    }
    
    func setBut(){
        loginBut.frame = CGRect(x:self.view.bounds.width*0.1, y:self.view.bounds.height*0.6, width:self.view.bounds.width*0.8, height:57)
        loginBut.setTitle("登录", for: .normal)
        loginBut.backgroundColor = UIColor(red: 0, green: 143/255, blue: 247/255, alpha: 1.0)
        loginBut.layer.opacity = 0.85
        loginBut.layer.cornerRadius = 6
        
        let tip = UILabel()
        tip.frame = CGRect(x: self.view.bounds.width*0.1, y:self.view.bounds.height*0.7,width:self.view.bounds.width*0.8, height:55)
        tip.text = "请使用统一身份验证进行登录"
        tip.textColor = .white
        tip.font = UIFont.systemFont(ofSize: 13)
        
        
        self.view.addSubview(loginBut)
        self.view.addSubview(tip)
    }
    
    @objc func loginCheck() {
        let ID = studentID.text
        let psw = psword.text
        
        if !(ID?.isEmpty)! && !(psw?.isEmpty)!{
            self.performSegue(withIdentifier: "toHome", sender: self)
        }
        
    }
    
}
