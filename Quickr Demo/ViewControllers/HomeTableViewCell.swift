//
//  HomeTableViewCell.swift
//  Quickr Demo
//
//  Created by Rishabh Raj on 19/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class HomeTableViewCell : UITableViewCell {
    
    let titleHeadingLabel = QDLabel(textName: "Title")
    
    let categoryLabel = QDLabel(textName: "Category")
    
    let descLabel = QDLabel(textName: "Description")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        descLabel.numberOfLines = 3
        
        addSubview(titleHeadingLabel)
        addSubview(categoryLabel)
        addSubview(descLabel)
        
        let inset : CGFloat = 8
        titleHeadingLabel.anchor(top: topAnchor, bottom: nil, left: leftAnchor, right: nil, paddingTop: inset, paddingBottom: 0, paddingLeft: inset, paddingRight: 0, height: 0, width: 0)
        categoryLabel.anchor(top: topAnchor, bottom: nil, left: nil, right: rightAnchor, paddingTop: inset, paddingBottom: 0, paddingLeft: 0, paddingRight: inset, height: 0, width: 0)
        descLabel.anchor(top: nil, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: inset, paddingLeft: inset, paddingRight: inset, height: 0, width: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
