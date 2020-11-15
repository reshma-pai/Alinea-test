//
//  ThemesCollectionViewCell.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell : UICollectionViewCell {
    
    static let width = Utility.screenDimension().width / 2 - 15
    
    var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 40))
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = Colors.textColor
        return label
        
    }()
    
    private let iconImageView : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: ImageConstants.crypto))
        imgView.frame = CGRect(x: 0, y: 0, width: width, height: 80)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
        addSubview(titleLabel)
        addSubview(iconImageView)
    }
    
    func configureCell(item : ThemesModel) {
        addSubview(titleLabel)
        addSubview(iconImageView)
        titleLabel.frame = CGRect(x: 0, y: iconImageView.frame.height, width: ThemesCollectionViewCell.width, height: 100)
        titleLabel.text = item.name
        iconImageView.image = UIImage(named: item.image)
    }
}
