//
//  ViewController.swift
//  CarthageDemo
//
//  Created by Yang Li on 2020/8/9.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        
        let box = UIView()
        box.backgroundColor = .red
        view.addSubview(box)
        
        box.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20)
        }
    }


}

