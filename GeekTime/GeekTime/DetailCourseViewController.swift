//
//  DetailCourseViewController.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/10.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class DetailCourseViewController: BaseViewController {
    
    var course: Course!
    var avatarView: UIImageView!
    var nameLabel: UILabel!
    var descLabel: UILabel!
    var teacherLabel: UILabel!
    var lessonCountLabel: UILabel!
    var studentCountLabel: UILabel!
    var tab: Tab!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Course Detail"
        createTop()
        createMiddle()
        createBottom()
    }
    
    func createTop() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        let topView = UIView()
        topView.layer.contents = R.image.detailBg()?.cgImage
        blurView.layer.masksToBounds = true
        blurView.alpha = 0.7
        topView.addSubview(blurView)
        view.addSubview(topView)
        blurView.snp.makeConstraints({(make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(200)
        })
        topView.snp.makeConstraints({(make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(200)
        })
        
        avatarView = UIImageView()
        let round = RoundCornerImageProcessor(cornerRadius: 10)
        avatarView.kf.setImage(with: URL(string: course.coverImageUrl), placeholder: nil, options:[.processor(round)])
        topView.addSubview(avatarView)
        avatarView.snp.makeConstraints({(make) in
            make.left.top.equalTo(topView).offset(20)
            make.width.equalTo(82)
            make.height.equalTo(108)
        })
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.text = course.name
        topView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({(make) in
            make.left.equalTo(avatarView.snp_right).offset(10)
            make.top.equalTo(avatarView)
            make.right.equalTo(topView).offset(-15)
        })
        
        descLabel = UILabel(frame: .zero)
        descLabel.textColor = .white
        descLabel.font = UIFont.systemFont(ofSize: 14)
        descLabel.text = course.desc
        descLabel.numberOfLines = 2
        topView.addSubview(descLabel)
        descLabel.snp.makeConstraints({(make) in
            make.left.equalTo(avatarView.snp_right).offset(10)
            make.top.equalTo(nameLabel.snp_bottom).offset(5)
            make.right.equalTo(topView).offset(-15)
        })
        
        teacherLabel = UILabel(frame: .zero)
        teacherLabel.textColor = .white
        teacherLabel.font = UIFont.systemFont(ofSize: 14)
        teacherLabel.text = "Teacher: \(course.teacher)"
        topView.addSubview(teacherLabel)
        teacherLabel.snp.makeConstraints { (make) in
            make.left.equalTo(avatarView.snp_right).offset(10)
            make.bottom.equalTo(avatarView)
            make.right.equalTo(topView).offset(-15)
        }
        
        let bookAttachment = NSTextAttachment()
        bookAttachment.image = R.image.book()
        bookAttachment.bounds = CGRect(x: 0, y: -3, width: bookAttachment.image?.size.width ?? 0, height: bookAttachment.image?.size.height ?? 0)
        let bookAttachmentString = NSAttributedString(attachment: bookAttachment)
        let lessonCountString = NSMutableAttributedString(string: "")
        lessonCountString.append(bookAttachmentString)
        let lessonCountStringAfterIcon = NSAttributedString(string: " Total \(course.totalLesson), Updated \(course.updatedLesson)")
        lessonCountString.append(lessonCountStringAfterIcon)
        
        lessonCountLabel = UILabel(frame: .zero)
        lessonCountLabel.textColor = .white
        lessonCountLabel.font = UIFont.systemFont(ofSize: 14)
        lessonCountLabel.attributedText = lessonCountString
        topView.addSubview(lessonCountLabel)
        lessonCountLabel.snp.makeConstraints({(make) in
            make.left.equalTo(topView).offset(20)
            make.bottom.equalTo(topView).offset(-15)
        })
        
        let studentAttachment = NSTextAttachment()
        studentAttachment.image = R.image.student()
        studentAttachment.bounds = CGRect(x: 0, y: -3, width: studentAttachment.image?.size.width ?? 0, height: studentAttachment.image?.size.height ?? 0)
        let studentAttachmentString = NSAttributedString(attachment: studentAttachment)
        let studentCountString = NSMutableAttributedString(string: "")
        studentCountString.append(studentAttachmentString)
        let studentCountStringAfterIcon = NSAttributedString(string: " Total \(course.studentCount) Learning")
        studentCountString.append(studentCountStringAfterIcon)
        
        studentCountLabel = UILabel(frame: .zero)
        studentCountLabel.textColor = .white
        studentCountLabel.font = UIFont.systemFont(ofSize: 14)
        studentCountLabel.attributedText = studentCountString
        topView.addSubview(studentCountLabel)
        studentCountLabel.snp.makeConstraints { (make) in
            make.right.equalTo(topView).offset(-20)
            make.bottom.equalTo(topView).offset(-15)
        }
    }

    func createMiddle() {
        tab = Tab(items: ["Course Introduction", "Course Catalog"])
        view.addSubview(tab)
        tab.snp.makeConstraints({(make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(200)
            make.height.equalTo(50)
        })
    }
    
    func createBottom() {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("Buy $\(course.price)", for: .normal)
        button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        button.addTarget(self, action: #selector(didClickBuyButton), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints({(make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50)
        })
    }
    
    @objc func didClickBuyButton() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
