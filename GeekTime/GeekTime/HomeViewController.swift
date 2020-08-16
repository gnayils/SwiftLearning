//
//  HomeViewController.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/9.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController, BannerViewDataSource, CommonListDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 176))
        bannerView.autoScrollInveral = 2
        bannerView.isInfinite = true
        bannerView.dataSource = self
        view.addSubview(bannerView)
        
        let courseList = CommonList<Course, CourseCell>(frame: .zero)
        courseList.items = MockData.getCourseList()
        courseList.delegate = self
        view.addSubview(courseList)
        courseList.snp.makeConstraints({(make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bannerView.snp_bottom).offset(5)
        })
        
    }

    func numberOfBanners(_ bannerView: BannerView) -> Int {
        return MockData.getBannerList().count
    }
    
    func viewFromBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: MockData.getBannerList()[index]))
            return view 
        } else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: MockData.getBannerList()[index]))
            return imageView
        }
    }
    
    func didSelectItem<Item>(_ item: Item) {
        if let course = item as? Course {
            let detailVC = DetailCourseViewController()
            detailVC.course = course
            detailVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }
}
