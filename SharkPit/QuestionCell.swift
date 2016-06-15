//
//  QuestionCell.swift
//  SharkPit
//
//  Created by Tyler Jasper on 6/4/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class QuestionCell: UICollectionViewCell {
    
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var question: Question? {
        didSet {
            if let question = question {
                questionImageView.image = UIImage(named: question.imageName)
                questionTitleLabel.text = question.caption
                questionLabel.text = question.description
            }
        }
    }
}
