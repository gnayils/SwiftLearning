//
//  CourseList.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/10.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CourseCell: CommonListCell<Course> {
    
    let priceLabel: UILabel
    let courseCoverImageView: UIImageView
    
    override var item: Course? {
        didSet {
            if let c = self.item {
                self.courseCoverImageView.kf.setImage(with: URL(string: c.coverImageUrl))
                self.textLabel?.text = c.name
                self.detailTextLabel?.text = c.desc
                self.priceLabel.text = "$\(c.price)"
            }
        }
    }
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        priceLabel = UILabel(frame: .zero)
        courseCoverImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        textLabel?.textColor = UIColor.hexColor(0x333333)
        detailTextLabel?.textColor = UIColor.hexColor(0x333333)
        detailTextLabel?.numberOfLines = 2
        priceLabel.textColor = UIColor.hexColor(0xe23b41)
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        courseCoverImageView.contentMode = .scaleAspectFit
        courseCoverImageView.clipsToBounds = true
        
        contentView.addSubview(priceLabel)
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
        
        priceLabel.snp.makeConstraints({(make) in
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
