//
//  ViewController.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    var viewModel : MainScreenViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
}

fileprivate extension MainScreenViewController {
    
    func setupViewModel() {
        viewModel = MainScreenViewModel(parentView: self.view)
    }
}
