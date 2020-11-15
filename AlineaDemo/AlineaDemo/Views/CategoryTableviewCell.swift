//
//  CategoryTableviewCell.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class CategoryTableviewCell : UITableViewCell {
    
    enum ViewType  {
        case category
        case trend
    }
    
    var viewType : ViewType = .category
    
    private let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 30, width: 100, height: 30))
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = Colors.backgroundColor
        return label
        
    }()
    
    private let cardView : UIView = {
        let view = UIView(frame: CGRect(x: 30, y: 5, width: UIScreen.main.bounds.width - 60, height: 140))
        view.clipsToBounds = true
        view.layer.cornerRadius = 28
        return view
    }()
    
    private let iconImageView : UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 40, y: 30, width: 20, height: 20))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cardView)
        addSubview(titleLabel)
        addSubview(iconImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(item: CategoryItem, type : ViewType = .category) {
        if type == .trend {
            cardView.removeFromSuperview()
            titleLabel.textColor = Colors.textColor
        }
        let (title, imageName, color) = item.getItemDetails()
        cardView.backgroundColor = color
        titleLabel.text = title
        iconImageView.image = UIImage(named: imageName)
        
        
    }
}
