//
//  CategoryModel.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

struct CategoryModel {
    
    func getItems() -> [CategoryItem] {
        return [.stock, .etf, .crypto]
    }
    
    func getSections() -> [String] {
        return Constants.sections
    }
}

enum CategoryItem {
    case stock
    case etf
    case crypto
    
    func getItemDetails() -> (String, String, UIColor){
        switch self {
        case .stock: return (Constants.stocks, ImageConstants.stocks, Colors.stocksColor)
        case .etf: return (Constants.etf, ImageConstants.etf, Colors.etfColor)
        case .crypto: return (Constants.crypto, ImageConstants.crypto, Colors.cryptoColor)
        }
    }
}
