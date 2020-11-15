//
//  CategoryViewModel.swift
//  AlineaDemo
//
//  Created by Reshma Pai on 15/11/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewModel {
    
    init(parentView : UIView) {
        self.parentView = parentView
        parentView.backgroundColor = setupTheme()
        parentView.addSubview(addTopBar())
        parentView.addSubview(addBottomBar())
        parentView.addSubview(addSegmentsView())
        
    }
    
    fileprivate let model = MainScreenModel()
    fileprivate let categoryViewModel = CategoryViewModel()
    fileprivate let themesViewModel = ThemesViewModel()
    fileprivate let trendViewModel = TrendingViewModel()
    fileprivate var topView : UIView?
    fileprivate var bottomBarView: UIView!
    fileprivate var segmentsArray = [UIButton]()
    fileprivate var bottomBarArray = [UIButton]()
    fileprivate var topSpacing : CGFloat = 20
    fileprivate var parentView : UIView!
    
    func setupTheme() -> UIColor{
        return Colors.backgroundColor
    }
    
    func addTopBar() -> UIView{
        topView = UIView(frame: CGRect(x: 0, y: topSpacing, width: UIScreen.main.bounds.width, height: 60))
        topView?.clipsToBounds = true
        if let topView = topView {
            let titleLabel = UILabel(frame: topView.frame)
            titleLabel.center = topView.center
            titleLabel.textAlignment = .center
            titleLabel.text = Constants.mainScreenTitle
            titleLabel.textColor = Colors.textColor
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
            topView.addSubview(titleLabel)
            
            return topView
        }
        
        return UIView()
    }
    
    func addSegmentsView() -> UIView {
        let segments : [String] = model.getSegments()
        
        let segmentsView = UIView(frame: CGRect(x: 0, y: (topView?.frame.minY ?? 0) + 60 + topSpacing, width: UIScreen.main.bounds.width, height: 30))
        segmentsView.clipsToBounds = true
        
        var i = 0
        
        for segment in segments {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / CGFloat(segments.count), height: 30))
            button.addTarget(self, action: #selector(segmentSeleted(button:)), for: .touchUpInside)
            button.tag = i
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(Colors.textColor, for: .normal)
            button.setTitleColor(Colors.selectedSegmentColor, for: .selected)
            button.setTitle(segment, for: .normal)
            segmentsArray.append(button)
            i += 1
        }
        segmentsArray.first?.isSelected = true
        if let button = segmentsArray.first {
            segmentSeleted(button: button)
        }

        //Stack View
        let stackView = UIStackView()
        stackView.frame = segmentsView.bounds
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16.0
        
        for button in segmentsArray {
            stackView.addArrangedSubview(button)
        }
        segmentsView.addSubview(stackView)
        
        return segmentsView
    }
    
    @objc func segmentSeleted(button : UIButton) {
        segmentsArray.forEach({
            $0.isSelected = false
        })
        button.isSelected = true
        
        switch button.tag {
        case 0:
            let frame = CGRect(x: 0, y: 140, width: UIScreen.main.bounds.width, height: Utility.screenDimension().height - bottomBarView.frame.height - 140)
            parentView.addSubview(categoryViewModel.setupUI(frame: frame))
        case 1:
            let frame = CGRect(x: 0, y: 140, width: UIScreen.main.bounds.width, height: Utility.screenDimension().height - bottomBarView.frame.height - 140)
            parentView.addSubview(themesViewModel.setupUI(frame: frame))
        case 2:
            let frame = CGRect(x: 0, y: 140, width: UIScreen.main.bounds.width, height: Utility.screenDimension().height - bottomBarView.frame.height - 140)
            parentView.addSubview(trendViewModel.setupUI(frame: frame))
        default:
            return
        }
    }
    
    func addBottomBar() -> UIView{
        bottomBarView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width, height: 50))
        bottomBarView.clipsToBounds = true
        
        let bottomBarItems : [String] = model.getBottomBarItems()
        var i = 0
        
        for item in bottomBarItems {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / CGFloat(bottomBarItems.count), height: 40))
            button.addTarget(self, action: #selector(bottomBarItemSelected(button:)), for: .touchUpInside)
            button.tag = i
            button.tintColor = Colors.selectedSegmentColor
            button.setImage(UIImage(named: item), for: .normal)
            button.setImage(UIImage(named: ImageConstants.bottomBarSelected), for: .selected)
            bottomBarArray.append(button)
            i += 1
        }
        
        bottomBarArray.first?.isSelected = true
        bottomBarArray.first?.backgroundColor = Colors.selectedSegmentColor
        
        //Stack View
        let stackView = UIStackView()
        stackView.frame = bottomBarView.bounds //?? CGRect.zero
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16.0
        
        for button in bottomBarArray {
            stackView.addArrangedSubview(button)
        }
        bottomBarView.addSubview(stackView)
        
        return bottomBarView
    }
    
    @objc func bottomBarItemSelected(button: UIButton) {
        bottomBarArray.forEach({
            $0.isSelected = false
            $0.backgroundColor = .clear
        })
        button.isSelected = true
        button.backgroundColor = Colors.selectedSegmentColor
    }
}
