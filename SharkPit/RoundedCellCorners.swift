//
//  RoundedCellCorners.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/6/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit


// Not working
@IBDesignable
class RoundedCellCorners: UIView {
    
     var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
    }
}