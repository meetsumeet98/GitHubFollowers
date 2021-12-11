//
//  GHTitleLabel.swift
//  GitHubFollowers
//
//  Created by Sumeet Bhujang on 04/12/21.
//

import UIKit

class GFTitleLabel: UILabel {

    // MARK:- Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)

        configure()
    }

    // MARK:- Configure

    private func configure() {
        textColor = .label // So that color is white on dark and black on light.
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        numberOfLines = 1
    }
}
