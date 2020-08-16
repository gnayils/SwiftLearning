//
//  CommonCell.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/12.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CommonCell: UIControl {
    
    var titleView: UILabel
    var iconView: UIImageView
    var bottomLine: UIView
    var arrowView: UIImageView
    var highlightView: UIView
    
    var title: String? {
        didSet { self.titleView.text = self.title }
    }
    
    var icon: UIImage? {
        didSet { self.iconView.image = self.icon }
    }
    
    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.highlightView.alpha = 1
                self.highlightView.isHidden = false
            } else {
                UIView.animate(withDuration: 0.5,
                       animations: {
                            self.highlightView.alpha = 0
                       },
                       completion: { finished in
                            self.highlightView.isHidden = true
                       }
                )
            }
        }
    }
    
    override init(frame: CGRect) {
        titleView = UILabel()
        iconView = UIImageView()
        bottomLine = UIView()
        arrowView = UIImageView(image: R.image.icon_right_arrow())
        highlightView = UIView()
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented yet")
    }
    
    func setupViews() {
        self.addSubview(highlightView)
        highlightView.backgroundColor = UIColor(white: 0.5, alpha: 1)
        highlightView.isHidden = true
        highlightView.alpha = 0
        highlightView.snp.makeConstraints({(make) in
            make.edges.equalToSuperview()
        })
        
        self.addSubview(iconView)
        iconView.snp.makeConstraints({(make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(32)
        })
        
        self.addSubview(titleView)
        titleView.textColor = UIColor.hexColor(0x333333)
        titleView.font = UIFont.systemFont(ofSize: 15)
        titleView.snp.makeConstraints({(make) in
            make.left.equalTo(iconView.snp_right).offset(10)
            make.centerY.equalToSuperview()
        })
        
        self.addSubview(arrowView)
        arrowView.snp.makeConstraints({(make) in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        })
        
        self.addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor(white: 0.95, alpha: 1)
        bottomLine.snp.makeConstraints({(make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1 / UIScreen.main.scale)
        })
    }

}
