//
//  ArticleListViewController.swift
//  DevTipsDemo_iOS
//
//  Created by Carl on 2022/11/8.
//

import UIKit

class ArticleListViewController: UIViewController {
    let postTitles = ["Use Background Transfer Service To Download File in Background",
                      "Face Detection in iOS Using Core Image",
                      "Building a Speech-to-Text App Using Speech Framework in iOS 10",
                      "Building Your First Web App in Swift Using Vapor",
                      "Creating Gradient Colors Using CAGradientLayer",
                      "A Beginner's Guide to CALayer"];
    let postImages = ["imessage-sticker-pack", "face-detection-featured", "speech-kit-featured", "vapor-web-framework", "cagradientlayer-demo", "calayer-featured"];

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 258.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "APPCODA"

        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        cell.postImageView.image = UIImage(named: postImages[indexPath.row])
        cell.titleLabel.text = postTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 1.淡入动画
//        // 定义初始状态
//        cell.alpha = 0
//        // 定义结束状态
//        UIView.animate(withDuration: 1.0) {
//            cell.alpha = 1
//        }
        
        /**
         * CATransform3DMakeRotation(_ angle: CGFloat, _ x: CGFloat, _ y: CGFloat, _ z: CGFloat)
         * angle: 以弧度表示的角度
         * x: 代表从画面左边至右边的轴
         * y: 代表从画面上方到底部的轴
         * z: 代表穿出画面的轴
         */
        
        // 2.旋转动画
        // 定义初始状态
        let rotationAngleInRadians = 90.0 * CGFloat(Double.pi / 180.0)
        let rotationTransform = CATransform3DMakeRotation(rotationAngleInRadians, 0, 0, 1)
        cell.layer.transform = rotationTransform
        // 定义结束状态
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
        }
        
        // 3.飞入动画
//        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
//        cell.layer.transform = rotationTransform
//        // 定义结束状态
//        UIView.animate(withDuration: 1.0) {
//            cell.layer.transform = CATransform3DIdentity
//        }
    }
}


