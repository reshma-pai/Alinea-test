//
//  CategoryViewModel.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class CategoryViewModel : NSObject{
    
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

extension CategoryViewModel : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryTableviewCell.self)) as! CategoryTableviewCell
        let item = model.getItems()[indexPath.row]
        cell.configureCell(item: item)
        cell.selectionStyle = .none
        return cell
    }
}

extension CategoryViewModel : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
