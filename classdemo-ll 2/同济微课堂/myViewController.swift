//
//  ViewController.swift
//  TWeiKE
//
//  Created by yuannnn on 2017/8/22.
//  Copyright © 2017年 yuannnn. All rights reserved.
//

import UIKit

class myViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var mainTitleArr = ["高等数学","线性代数","普通物理"]
    var subTitleArr = ["数学科学学院","数学科学学院","物理科学学院"]
    var testTimeArr = ["2017年7月10日","2017年7月20日","2017年7月30日"]
    var testTime1Arr = ["9:00-11:00","9:00-11:00","9:00-11:00"]
    var testPlaceArr = ["F楼204","F楼206","F楼208"]
    private let kScreenWidth = UIScreen.main.bounds.size.width
    @IBOutlet weak var doingButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var testButton: UIButton!
    var stateForPage:Int = 1
    @IBOutlet weak var totalTableView: UITableView!
    @IBOutlet weak var tableForTreeBar: UITableView!
    @IBOutlet var blueBar: UIView!
    @IBAction func doingClass(_ sender: UIButton) {
        doingButton.setTitleColor(UIColor.init(red: 32/255, green: 150/255, blue: 243/255, alpha: 1), for: UIControlState.normal)
        doneButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        testButton.setTitleColor(UIColor.gray, for: UIControlState.normal)

        stateForPage = 1
        UIView.animate(withDuration: 0.5, animations: {
          self.blueBar.layer.position.x=sender.layer.position.x
        })
        totalTableView.reloadData()
    }
    @IBAction func classList(_ sender: UIButton) {
        doingButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        doneButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        testButton.setTitleColor(UIColor.init(red: 32/255, green: 150/255, blue: 243/255, alpha: 1), for: UIControlState.normal)
        UIView.animate(withDuration: 0.5, animations: {
            self.blueBar.layer.position.x=sender.layer.position.x
        })
        stateForPage = 2
        totalTableView.reloadData()
    }
    @IBAction func doneClass(_ sender: UIButton) {
        doingButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        doneButton.setTitleColor(UIColor.init(red: 32/255, green: 150/255, blue: 243/255, alpha: 1), for: UIControlState.normal)
        testButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        UIView.animate(withDuration: 0.5, animations: {
            self.blueBar.layer.position.x=sender.layer.position.x
        })
        stateForPage = 3
        totalTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doingButton.setTitleColor(UIColor.init(red: 32/255, green: 150/255, blue: 243/255, alpha: 1), for: UIControlState.normal)
        doneButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        testButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        
        let y = (self.navigationController?.navigationBar.bounds.height)! + 10
        let height = self.view.bounds.height - y
        totalTableView.frame = CGRect(x: 10, y: y, width: kScreenWidth-20, height: height)
        totalTableView.layer.shadowOffset = CGSize(width: 0, height: 3)
        totalTableView.separatorColor = UIColor.lightGray
        totalTableView.delegate = self
        totalTableView.dataSource = self
        
//        totalTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height*0.35
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch stateForPage {
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        switch stateForPage {
        case 1:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "1")
            //            let icon = UIImage(named: "test")
            //            let itemSize = CGSize(width: 340, height: 120);//固定图片大小为36*36
            //            UIGraphicsBeginImageContextWithOptions(itemSize, false, 0.0);//*1
            //            let imageRect = CGRect(x: 0, y: 0, width: itemSize.width, height: itemSize.height);
            //            icon?.draw(in: imageRect)
            //            cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
            //            cell.imageView?.layer.masksToBounds = true
            //            UIGraphicsEndImageContext()
            let cellImg = UIImageView(frame: CGRect(x: 38, y: 10, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.23))
            cellImg.layer.shadowOffset = CGSize(width: 100, height: 3)
            cellImg.layer.shadowColor = UIColor.darkGray.cgColor
            cellImg.layer.shadowOpacity = 0.8
            cellImg.layer.shadowRadius = 8
            
            cellImg.layer.cornerRadius = 6
            cellImg.layer.masksToBounds = true
            
            //            if !coursesImages.isEmpty{
            //                cellImg.image = coursesImages[indexPath.row]
            //            }
            cellImg.image = UIImage(named: mainTitleArr[indexPath.row])
            cell.addSubview(cellImg)
            
            //mainTitle
            let mainTitle = UILabel(frame: CGRect(x: 38, y: cellImg.bounds.height, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            mainTitle.text = mainTitleArr[indexPath.row]
            mainTitle.textColor = UIColor.darkText
            mainTitle.font = UIFont.systemFont(ofSize: 22, weight: .light)
            
            //subTitle
            let subTitle = UILabel(frame: CGRect(x: 38, y: cellImg.bounds.height + 30, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            subTitle.text = subTitleArr[indexPath.row]
            subTitle.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            subTitle.textColor = UIColor.darkGray
            
            cell.addSubview(cellImg)
            cell.addSubview(mainTitle)
            cell.addSubview(subTitle)
            
            cell.accessoryType = .none
            return cell
        case 2:
//            let cell = UITableViewCell(style: .default, reuseIdentifier: "1")
//            cell.textLabel?.text = "高等数学"
//            cell.textLabel?.textAlignment = NSTextAlignment.center
            
            let cell = UITableViewCell(style: .default, reuseIdentifier: "1")
            //mainTitle
            let mainTitle = UILabel(frame: CGRect(x: 38, y: cell.bounds.height-30, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            mainTitle.text = mainTitleArr[indexPath.row]
            mainTitle.textAlignment = NSTextAlignment.center
            mainTitle.textColor = UIColor.darkText
            mainTitle.font = UIFont.systemFont(ofSize: 22, weight: .light)
            
            //subTitle
            let subTitle = UILabel(frame: CGRect(x: 38, y: cell.bounds.height+10 , width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            subTitle.text = subTitleArr[indexPath.row]
            subTitle.textAlignment = NSTextAlignment.center
            subTitle.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            subTitle.textColor = UIColor.darkGray
            
            //subTitle
            let testtime = UILabel(frame: CGRect(x: 38, y: cell.bounds.height + 40, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            testtime.text = testTimeArr[indexPath.row]
            testtime.textAlignment = NSTextAlignment.center
            testtime.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            testtime.textColor = UIColor.darkGray
            
            let testtime1 = UILabel(frame: CGRect(x: 38, y: cell.bounds.height + 70, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            testtime1.text = testTime1Arr[indexPath.row]
            testtime1.textAlignment = NSTextAlignment.center
            testtime1.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            testtime1.textColor = UIColor.darkGray
            
            let testplace = UILabel(frame: CGRect(x: 38, y: cell.bounds.height + 100, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            testplace.text = testPlaceArr[indexPath.row]
            testplace.textAlignment = NSTextAlignment.center
            testplace.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            testplace.textColor = UIColor.darkGray
            
            cell.addSubview(mainTitle)
            cell.addSubview(subTitle)
            cell.addSubview(testtime)
            cell.addSubview(testtime1)
            cell.addSubview(testplace)
            return cell
        case 3:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "1")
//            let icon = UIImage(named: "test")
//            let itemSize = CGSize(width: 340, height: 120);//固定图片大小为36*36
//            UIGraphicsBeginImageContextWithOptions(itemSize, false, 0.0);//*1
//            let imageRect = CGRect(x: 0, y: 0, width: itemSize.width, height: itemSize.height);
//            icon?.draw(in: imageRect)
//            cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
//            cell.imageView?.layer.masksToBounds = true
//            UIGraphicsEndImageContext()
            let cellImg = UIImageView(frame: CGRect(x: 38, y: 10, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.23))
            cellImg.layer.shadowOffset = CGSize(width: 100, height: 3)
            cellImg.layer.shadowColor = UIColor.darkGray.cgColor
            cellImg.layer.shadowOpacity = 0.8
            cellImg.layer.shadowRadius = 8
            
            cellImg.layer.cornerRadius = 6
            cellImg.layer.masksToBounds = true
            
//            if !coursesImages.isEmpty{
//                cellImg.image = coursesImages[indexPath.row]
//            }
            cellImg.image = UIImage(named: mainTitleArr[indexPath.row])
            cell.addSubview(cellImg)
            
            //mainTitle
            let mainTitle = UILabel(frame: CGRect(x: 38, y: cellImg.bounds.height, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            mainTitle.text = mainTitleArr[indexPath.row]
            mainTitle.textColor = UIColor.darkText
            mainTitle.font = UIFont.systemFont(ofSize: 22, weight: .light)
            
            //subTitle
            let subTitle = UILabel(frame: CGRect(x: 38, y: cellImg.bounds.height + 30, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
            subTitle.text = subTitleArr[indexPath.row]
            subTitle.font = UIFont.systemFont(ofSize: 18, weight: .thin)
            subTitle.textColor = UIColor.darkGray
            
            cell.addSubview(cellImg)
            cell.addSubview(mainTitle)
            cell.addSubview(subTitle)
            
            cell.accessoryType = .none
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "1")
            let icon = UIImage(named: "test")
            let itemSize = CGSize(width: 340, height: 120);//固定图片大小为36*36
            UIGraphicsBeginImageContextWithOptions(itemSize, false, 0.0);//*1
            let imageRect = CGRect(x: 0, y: 0, width: itemSize.width, height: itemSize.height);
            icon?.draw(in: imageRect)
            cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
            cell.imageView?.layer.masksToBounds = true
            
            UIGraphicsEndImageContext()
            return cell
        }

    }
}

