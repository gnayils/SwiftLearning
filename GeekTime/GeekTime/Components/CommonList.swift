//
//  CommonList.swift
//  GeekTime
//
//  Created by Yang Li on 2020/8/12.
//  Copyright © 2020 Yang Li. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CommonListCell<ItemType>: UITableViewCell {
    
    var item: ItemType?
    
    override required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
       fatalError("Not implemented yet")
    }
}

protocol CommonListDelegate: AnyObject {
    
    func didSelectItem<Item>(_ item: Item)
}

class CommonList<ItemType, CellType: CommonListCell<ItemType>>: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView
    var items: [ItemType]! = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    weak var delegate: CommonListDelegate?
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)
        tableView.snp.makeConstraints({(make) in
            make.edges.equalToSuperview()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CellType? = tableView.dequeueReusableCell(withIdentifier: "CellID") as? CellType
        if cell == nil {
            cell = CellType(style: .subtitle, reuseIdentifier: "CellID")
        }
        cell?.item = items[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
