//
//  QDTextField.swift
//  Quickr Demo
//
//  Created by Rishabh Raj on 19/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class QDTextField : UITextField {
    
    init(frame: CGRect = .zero, placeholderText : String = "Default") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false 
        }
        self.placeholder = placeholderText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
