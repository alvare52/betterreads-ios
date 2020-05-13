//
//  StarRatingStackView.swift
//  BetterReads
//
//  Created by Jorge Alvarez on 5/11/20.
//  Copyright © 2020 Labs23. All rights reserved.
//

import Foundation
import UIKit

class StarRatingStackView: UIStackView {
    
    /// Holds 5 star images insied
    var starsView: UIView!
    
    /// Array of star images
    var starsArray = [UIImageView]()
    
    // FIXME: give this a didSet later that calls updateStarRating
    /// How many stars should be filled in
    var ratingValue: Double? {
        didSet {
            updateStarRating()
        }
    }
    var starSize: Double = 20.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init with frame")
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        print("init with coder")
        setupSubviews()
    }
    
    /// Sets up stackView and stars
    private func setupSubviews() {
        
        distribution = .fillEqually
        //let starSize = Int(20) // FIXME: should be based on view size?
        for i in 1...5 {
            let star = UIImageView()
            star.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(star)
            starsArray.append(star)
            star.tag = i
            star.contentMode = .scaleToFill
            star.frame = CGRect(x: 0,
                                y: 0,
                                width: starSize,
                                height: starSize)
            star.image = UIImage(named: "Stars_Chunky-AltoGray")
        }
        updateStarRating()
    }
    
    private func updateStarRating() {
        
        let value = ratingValue ?? 0
        var chunk = value
        for star in starsArray {
            if chunk >= 0.66 && chunk <= 5.0 {
                star.image = UIImage(named: "Stars_Chunky-DoveGray")
            } else if chunk >= 0.33 && chunk < 0.66 {
                star.image = UIImage(named: "Stars_Chunky-AltoGray-LeftHalf")
            } else {
                star.image = UIImage(named: "Stars_Chunky-AltoGray")
            }
            chunk = value - Double(star.tag)
        }
    }
}