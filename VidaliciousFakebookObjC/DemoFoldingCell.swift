//
//  DemoFoldingCell.swift
//  VidaliciousFakebookObjC
//
//  Created by vidalicious on 2018/11/7.
//  Copyright © 2018 vidalicious. All rights reserved.
//

import UIKit
import FoldingCell
import EasyPeasy

class DemoFoldingCell: FoldingCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView = createContainerView()
        foregroundView = createForegroundView()
        
        // super class method configure views
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type: AnimationType) -> TimeInterval {
        
        // durations count equal it itemCount
//        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        let durations = [0.26, 0.2, 0.2, 0.2, 0.2, 0.2]
        return durations[itemIndex]
    }
}

// MARK: Configure

extension DemoFoldingCell {
    
    private func createForegroundView() -> RotatedView {
        let foregroundView = RotatedView(frame: .zero)
        foregroundView.backgroundColor = UIColor.red
        foregroundView.translatesAutoresizingMaskIntoConstraints = false
//        {
//            $0.backgroundColor = .redColor()
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
        
        contentView.addSubview(foregroundView)
        
        // add constraints
        foregroundView.easy.layout(Height(75),Left(8),Right(8))
//        foregroundView <- [
//            Height(75),
//            Left(8),
//            Right(8),
//        ]
//
//        // add identifier
//        let top = (foregroundView <- [Top(8)]).first
//        top?.identifier = "ForegroundViewTop"
        
        foregroundViewTop = foregroundView.easy.layout(Top(8)).first
        
        foregroundView.layoutIfNeeded()
        
        return foregroundView
    }
    
    private func createContainerView() -> UIView {
        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = UIColor.green
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        {
//            $0.backgroundColor = .greenColor()
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
        
        contentView.addSubview(containerView)
        
        // add constraints
//        containerView <- [
//            Height(CGFloat(75 * itemCount)),
//            Left(8),
//            Right(8),
//        ]
//
//        // add identifier
//        let top = (containerView <- [Top(8)]).first
//        top?.identifier = "ContainerViewTop"
        itemCount = 5
        
        containerView.easy.layout(Height(CGFloat(75 * itemCount)),Left(8),Right(8))
        
        containerViewTop = containerView.easy.layout(Top(8)).first
        
        containerView.layoutIfNeeded()
        
        return containerView
    }
}
