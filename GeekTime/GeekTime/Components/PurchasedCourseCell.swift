//
//  PurchasedCourseCell.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/12.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class PurchasedCourseCell: CommonListCell<PurchasedCourse> {
    
    let progressLabel: UILabel
    let courseCoverImageView: UIImageView
    
    override var item: PurchasedCourse? {
        didSet {
            if let c = self.item {
                self.courseCoverImageView.kf.setImage(with: URL(string: c.course.coverImageUrl))
                self.textLabel?.text = c.course.name
                self.detailTextLabel?.text = c.course.desc
                self.progressLabel.text = "\(c.learningProgress)% Learned"
            }
        }
    }
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        progressLabel = UILabel(frame: .zero)
        courseCoverImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        textLabel?.textColor = UIColor.hexColor(0x333333)
        detailTextLabel?.textColor = UIColor.hexColor(0x999999)
        detailTextLabel?.numberOfLines = 2
        progressLabel.textColor = UIColor.hexColor(0x999999)
        progressLabel.font = UIFont.systemFont(ofSize: 15)
        courseCoverImageView.contentMode = .scaleAspectFit
        courseCoverImageView.clipsToBounds = true
        
        contentView.addSubview(progressLabel)
        contentView.addSubview(courseCoverImageView)
        
        courseCoverImageView.snp.makeConstraints {(make) in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        
        textLabel?.snp.makeConstraints({(make) in
            make.left.equalTo(courseCoverImageView.snp_right).offset(12)
            make.top.equalTo(courseCoverImageView)
            make.right.equalTo(contentView).offset(-20)
        })
        
        progressLabel.snp.makeConstraints({(make) in
            make.left.equalTo(textLabel!)
            make.centerY.equalTo(contentView)
        })
        
        detailTextLabel?.snp.makeConstraints({(make) in
            make.left.equalTo(textLabel!)
            make.bottom.equalTo(courseCoverImageView)
            make.right.equalTo(contentView).offset(20)
        })
    }
}
