//
//  RootViewController.swift
//  DevTipsDemo_iOS
//
//  Created by Carl on 2022/10/12.
//

import UIKit
import SnapKit

class RootViewController: UIViewController {
    let dataSource = [["title": "Adaptive UI", "class": NSStringFromClass(AdaptiveViewController.self)],
                      ["title": "Index Table", "class": NSStringFromClass(AnimalListViewController.self)],
                      ["title": "Cell Animation", "class": NSStringFromClass(ArticleListViewController.self)],
                      ["title": "MapKit Direction", "class": NSStringFromClass(RestaurantListViewController.self)]]
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = 54.0
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Tip List"
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    let revealViewController = SWRevealViewController(rearViewController: UIViewController(), frontViewController: UIViewController())
}

extension RootViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.textLabel?.text = dataSource[indexPath.row]["title"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let className = dataSource[indexPath.row]["class"] else {
            return
        }
        
        let myClass: AnyClass? = NSClassFromString(className)
        guard let myClassType = myClass as? UIViewController.Type else {
            return
        }
        
//        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
//            return
//        }
//
//        let myClass: AnyClass? = NSClassFromString(nameSpace + "." + className)
//        guard let myClassType = myClass as? UIViewController.Type else {
//            return
//        }
        
        let vc = myClassType.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
