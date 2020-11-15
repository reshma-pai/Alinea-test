//
//  TrendingViewModel.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation
import UIKit

class TrendingViewModel : NSObject{
    
    fileprivate let model = CategoryModel()
    fileprivate var tableView : UITableView!
    
    func setupUI(frame : CGRect) -> UIView{
        if tableView == nil {
            tableView = UITableView(frame: frame)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
        registerCell()
        return tableView
    }
    
    func registerCell() {
        tableView.register(CategoryTableviewCell.self, forCellReuseIdentifier: String(describing: CategoryTableviewCell.self))
    }
}

extension TrendingViewModel : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.getItems().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableviewCell.self)) as! CategoryTableviewCell
        let item = model.getItems()[indexPath.row]
        cell.configureCell(item: item, type: .trend)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: Utility.screenDimension().width, height: 100))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = Colors.textColor
        label.text = model.getSections()[section]
        return label
    }
}

extension TrendingViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
