//
//  ViewController.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/9.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem.image = R.image.home()
        homeVC.tabBarItem.selectedImage = R.image.home_selected()?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.hexColor(0x333333)], for: .selected)
        let navigationHomeVC = UINavigationController(rootViewController: homeVC)
        self.addChild(navigationHomeVC)
//        self.addChild(homeVC)
        
        let mineVC = MineViewController()
        mineVC.tabBarItem.image = R.image.mine()
        mineVC.tabBarItem.selectedImage = R.image.mine_selected()
        mineVC.tabBarItem.title = "Mine"
        mineVC.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.hexColor(0x333333)], for: .selected)
        let navigationMineVC = UINavigationController(rootViewController: mineVC)
        self.addChild(navigationMineVC)
//        self.addChild(mineVC)

//        let button = UIButton(type: .custom)
//        button.setTitle("click to login", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .black
//        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
//        view.addSubview(button)
//        button.snp.makeConstraints {(make) in
//            make.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(-20)
//            make.bottom.equalToSuperview().offset(-20)
//            make.height.equalTo(50)
//        }
    }
    
    @objc func didClickButton() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}

