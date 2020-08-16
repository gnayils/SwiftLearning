//
//  PurchasedCourseViewController.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/12.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import UIKit

class PurchasedCourseViewController: BaseViewController, CommonListDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        let purchasedCourseList = CommonList<PurchasedCourse, PurchasedCourseCell>(frame: .zero)
        purchasedCourseList.items = MockData.getPurchasedCourseList()
        purchasedCourseList.delegate = self
        view.addSubview(purchasedCourseList)
        purchasedCourseList.snp.makeConstraints({(make) in
            make.edges.equalToSuperview()
        })
    }

    func didSelectItem<Item>(_ item: Item) {
        if let i = item as? PurchasedCourse {
            NSLog("select: %@", i.course.name)
            print("select: \(i.course.name)")
        }
    }
    
}
