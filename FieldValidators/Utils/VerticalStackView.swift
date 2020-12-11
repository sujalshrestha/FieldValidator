//
//  VerticalStackView.swift
//  FieldValidators
//
//  Created by Sujal on 11/12/2020.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0, distribution: UIStackView.Distribution? = nil) {
        super.init(frame: .zero)
        arrangedSubViews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        if let distribution = distribution {
            self.distribution = distribution
        }
        axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
