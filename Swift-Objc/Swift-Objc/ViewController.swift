//
//  ViewController.swift
//  Swift-Objc
//
//  Created by Yang Li on 2020/8/5.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Swift Page"
        view.backgroundColor = .white
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y:100, width: 200, height: 50)
        button.setTitle("click to jump", for: .normal)
        button.setTitleColor(.black, for: .normal )
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        view.addSubview(button)
        
    }

    @objc func buttonClick() {
        let myVC = MyViewController()
        myVC.myTest()
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    
}

