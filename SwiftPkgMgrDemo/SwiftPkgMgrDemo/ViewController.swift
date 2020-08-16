//
//  ViewController.swift
//  SwiftPkgMgrDemo
//
//  Created by Yang Li on 2020/8/9.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("https://www.geekbang.org").response {
            response in debugPrint(response)
        }
    }


}

