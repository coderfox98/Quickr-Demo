//
//  QDButton.swift
//  Quickr Demo
//
//  Created by Rishabh Raj on 19/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class QDButton : UIButton {
    init(frame: CGRect = .zero, titleText : String = "Default") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false 
        }
        
        self.setTitle(titleText, for: .normal)
        self.backgroundColor = .darkBlue
        self.layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
