//
//  Binner.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/9.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol BannerViewDataSource: AnyObject {
    func numberOfBanners(_ bannerView: BannerView) -> Int
    func viewFromBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView
}

protocol BannerViewDelegate: AnyObject {
    func didSelectedBanner(_ bannerView: BannerView, index: Int)
}

class BannerView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView
    var flowLayout: UICollectionViewFlowLayout
    
    var pageControll: UIPageControl
    
    weak var dataSource: BannerViewDataSource! {
        didSet {
            pageControll.numberOfPages = self.dataSource.numberOfBanners(self)
            collectionView.reloadData()
            if isInfinite {
                DispatchQueue.main.async {
                    self.collectionView.setContentOffset(CGPoint(x: self.collectionView.frame.width, y: 0), animated: false)
                }
            }
        }
    }
    weak var delegate: BannerViewDelegate?
    
    var autoScrollInveral: Float = 0 {
        didSet {
            if self.autoScrollInveral > 0 {
                self.startAutoScroll()
            } else {
                self.stopAutoScroll()
            }
        }
    }
    var isInfinite: Bool = true
    var timer: Timer?
    
    static var cellID = "BannerViewCellID"
    static var convertViewTag = cellID.hashValue
    
    override init(frame: CGRect) {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.headerReferenceSize = .zero
        flowLayout.footerReferenceSize = .zero
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: flowLayout)
        pageControll = UIPageControl()
        super.init(frame: frame)
        self.setupViews()
    }
    
    func setupViews() {
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: BannerView.cellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.addSubview(collectionView)
        self.addSubview(pageControll)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        pageControll.snp.makeConstraints {(make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let pageNumber = dataSource.numberOfBanners(self)
        if isInfinite {
            if pageNumber == 1 {
                return 1
            } else {
                return pageNumber + 2
            }
        } else {
            return pageNumber
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerView.cellID, for: indexPath)
        var index = indexPath.row
        if isInfinite {
            let pageNumber = dataSource.numberOfBanners(self)
            if pageNumber > 1 {
                if indexPath.row == 0 {
                    index = pageNumber - 1
                } else if indexPath.row == pageNumber + 1{
                    index = 0
                } else {
                    index = indexPath.row - 1
                }
            }
        }
        
        if let view = cell.contentView.viewWithTag(BannerView.convertViewTag) {
            let _ = dataSource.viewFromBanner(self, index: index, convertView: view)
        } else {
            let newView = dataSource.viewFromBanner(self, index: index, convertView: nil)
            newView.tag = BannerView.convertViewTag
            cell.contentView.addSubview(newView)
            newView.snp.makeConstraints {(make) in
                make.edges.equalToSuperview()
            }
        }
        return cell
    }
    
    func startAutoScroll() {
        guard autoScrollInveral > 0 && timer == nil else {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(autoScrollInveral), target: self, selector: #selector(flipNext), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func stopAutoScroll() {
        if let t = timer {
            t.invalidate()
            timer = nil
        }
    }

    @objc func flipNext() {
        guard let _ = superview, let _ = window else {
            return
        }
        let totalPageNumber = dataSource.numberOfBanners(self)
        guard totalPageNumber > 1 else {
            return
        }
        
        let currentPageNumber = Int(round(collectionView.contentOffset.x / collectionView.frame.width))
        
        if isInfinite {
            let nextPageNumber = currentPageNumber + 1
            collectionView.setContentOffset(CGPoint(x: collectionView.frame.width * CGFloat(nextPageNumber), y: 0), animated: true)
            if nextPageNumber >= totalPageNumber + 1 {
                pageControll.currentPage = 0
            } else {
                pageControll.currentPage = nextPageNumber - 1
            }
        } else {
            var nextPageNumber = currentPageNumber + 1
            if nextPageNumber >= totalPageNumber {
                nextPageNumber = 0
            }
            collectionView.setContentOffset(CGPoint(x: collectionView.frame.width * CGFloat(nextPageNumber), y: 0), animated: true)
            
            pageControll.currentPage = nextPageNumber
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let totalPageNumber = dataSource.numberOfBanners(self)
        let currentPageNumber = Int(round(collectionView.contentOffset.x / collectionView.frame.width))
        if currentPageNumber >= totalPageNumber + 1 {
            collectionView.setContentOffset(CGPoint(x: collectionView.frame.width, y: 0), animated: false)
        }
        
    }
}
