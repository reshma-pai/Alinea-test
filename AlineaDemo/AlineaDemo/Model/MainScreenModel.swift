//
//  MainScreenModel.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation

struct MainScreenModel {
    
    func getSegments() -> [String] {
        return [Constants.category, Constants.themes, Constants.trending]
    }
    
    func getBottomBarItems() -> [String] {
        return [ImageConstants.bottomBarUnSelected, ImageConstants.bottomBarUnSelected, ImageConstants.bottomBarUnSelected, ImageConstants.bottomBarUnSelected, ImageConstants.bottomBarUnSelected]
    }
}
