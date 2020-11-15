//
//  Utility.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    class func screenDimension() -> CGRect {
        return UIScreen.main.bounds
    }
    
    class func createThemesModel() -> [ThemesModel] {
        return [ThemesModel(name: "Diversity & Inclusion", image: ImageConstants.stocks),
                ThemesModel(name: "BioTech", image: ImageConstants.stocks),
                ThemesModel(name: "CryptoCentral", image: ImageConstants.crypto),
                ThemesModel(name: "She runs it", image: ImageConstants.crypto),
                ThemesModel(name: "Clean & green", image: ImageConstants.stocks),
                ThemesModel(name: "Cannabis-ness", image: ImageConstants.crypto),
                ThemesModel(name: "Power it", image: ImageConstants.stocks),
                ThemesModel(name: "Foodie Fun", image: ImageConstants.stocks),
                ThemesModel(name: "Art & Fashion", image: ImageConstants.stocks),
                ThemesModel(name: "Home is where the heart is", image: ImageConstants.crypto)]
    }
}
