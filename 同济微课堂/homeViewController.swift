//
//  homeViewController.swift
//  同济微课堂
//
//  Created by mac on 2017/8/24.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import Alamofire

class homeViewController: UIViewController, SliderGalleryControllerDelegate, UITableViewDelegate, UITableViewDataSource{
    
    private var sliderGallery : SliderGalleryController!
    private let kScreenWidth = UIScreen.main.bounds.size.width
    private var table: UITableView!
    private var urls:Array<String> = []
    private var sliderUrls:Array<String> = []
    
    private var coursesImages:Array<UIImage> = []
    private var bannerImages:Array<UIImage> = []
    
    private var cell = UITableViewCell()

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        urls.append("http://123.207.13.131:1997/course_images/000001.jpg")
        urls.append("http://123.207.13.131:1997/course_images/000002.jpg")
        urls.append("http://123.207.13.131:1997/course_images/000003.png")
        
        sliderUrls.append("http://123.207.13.131:1997/banner_images/banner_image0.png")
        sliderUrls.append("http://123.207.13.131:1997/banner_images/banner_image1.jpg")
        sliderUrls.append("http://123.207.13.131:1997/banner_images/banner_image2.jpg")
        sliderUrls.append("http://123.207.13.131:1997/banner_images/banner_image3.jpg")
        sliderUrls.append("http://123.207.13.131:1997/banner_images/banner_image4.jpg")
        
        getCoursesImages(URLS:urls, isCoursesImages: true)
        getCoursesImages(URLS: sliderUrls, isCoursesImages: false)
        
        initSlider()
        initTableView()
    }
    

    
    func initSlider(){
        //初始化图片轮播组件
        sliderGallery = SliderGalleryController()
        sliderGallery.delegate = self
        sliderGallery.view.layer.masksToBounds = true
        sliderGallery.view.layer.cornerRadius = 4
        sliderGallery.view.frame = CGRect(x: 10, y: (self.navigationController?.navigationBar.bounds.height)!*1.25, width: kScreenWidth-20,
                                          height: self.view.bounds.height * 0.2);
        
        //将图片轮播组件添加到当前视图
        self.addChildViewController(sliderGallery)
        self.view.addSubview(sliderGallery.view)
        
        //添加组件的点击事件
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(homeViewController.handleTapAction(_:)))
        sliderGallery.view.addGestureRecognizer(tap)

    }
    
    @objc func handleTapAction(_ tap:UITapGestureRecognizer){
        //获取图片索引值
        let index = sliderGallery.currentIndex
        //弹出索引信息
        let alertController = UIAlertController(title: "您点击的图片索引是：",
                                                message: "\(index)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //delegate protocal
    func galleryDataSource() -> [String] {
        return ["banner_image0.png", "banner_image1.jpg", "banner_image2.jpg", "banner_image3.jpg", "banner_image4.jpg"]
    }
    
    func galleryScrollerViewSize() -> CGSize {
        return CGSize(width: kScreenWidth-20, height: self.view.bounds.height * 0.2)
    }
    
    //display tableView
    func initTableView() {
        let y = (self.navigationController?.navigationBar.bounds.height)! + self.view.bounds.height * 0.2 + 15
        let height = self.view.bounds.height - y
        table = UITableView(frame: CGRect(x: 20, y: y, width: kScreenWidth-40, height: height))
        table.layer.shadowOffset = CGSize(width: 0, height: 3)
        table.separatorColor = UIColor.black
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }
    
    //tableView protocal
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coursesImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cells")
        
        //image
        let cellImg = UIImageView(frame: CGRect(x: 30, y: 10, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.23))
        cellImg.layer.shadowOffset = CGSize(width: 100, height: 3)
        cellImg.layer.shadowColor = UIColor.darkGray.cgColor
        cellImg.layer.shadowOpacity = 0.8
        cellImg.layer.shadowRadius = 8
        
        cellImg.layer.cornerRadius = 6
        cellImg.layer.masksToBounds = true
        
        if !coursesImages.isEmpty{
            cellImg.image = coursesImages[indexPath.row]
        }
        
        //mainTitle
        let mainTitle = UILabel(frame: CGRect(x: 30, y: cellImg.bounds.height, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
        mainTitle.textColor = UIColor.darkText
        mainTitle.font = UIFont.systemFont(ofSize: 22, weight: .light)
        
        //subTitle
        let subTitle = UILabel(frame: CGRect(x: 30, y: cellImg.bounds.height + 30, width: (self.kScreenWidth-100), height: self.view.bounds.height*0.1))
        subTitle.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        subTitle.textColor = UIColor.darkGray
        
        if indexPath.row==0{
            mainTitle.text = "线性代数"
            subTitle.text = "数学科学学院"
        }else if indexPath.row == 1{
            mainTitle.text = "普通物理"
            subTitle.text = "物理学院"
        }else{
            mainTitle.text = "高等数学"
            subTitle.text = "数学科学学院"
        }
        
        self.cell.addSubview(cellImg)
        self.cell.addSubview(mainTitle)
        self.cell.addSubview(subTitle)
        
        self.cell.accessoryType = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height*0.35
    }
    
    func getCoursesImages(URLS: Array<String>, isCoursesImages: Bool){
        //通过接口获取图片
        let queue = DispatchQueue(label: "fetchImage")
        queue.async {
            for i in URLS{
                let url = URL(string: i)
                do {
                    let data = try Data(contentsOf: url!)
                    if isCoursesImages{
                        self.coursesImages.append(UIImage(data:data)!)
                        DispatchQueue.main.async {
                            self.table.reloadData()
                        }
                    }else{
                        self.bannerImages.append(UIImage(data:data)!)
                    }
                } catch let err as NSError {
                    print("err", err)
                }
            }
        }
        
    }
    
    private func get(url: String, completion: ((Data)->Void)? ){
        let newUrl = URL(string: url)
        
        var request = URLRequest(url: newUrl!)
        request.httpMethod = "GET"
        
        let quene = DispatchQueue(label: "")
        quene.async {
            let session = URLSession(configuration: .default)
            session.dataTask(with: request){(data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let data = data,
                    let completion = completion {
                    completion(data)
                }
                
            }.resume()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

