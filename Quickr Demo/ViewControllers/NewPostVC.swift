//
//  NewPostVC.swift
//  Quickr Demo
//
//  Created by Rishabh Raj on 19/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class NewPostVC : UIViewController {
    
    let 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightBlue
        
        setupNavBar()
        setupViews()
    }
    
    fileprivate func setupNavBar() {
        view.backgroundColor = .lightBlue
        
        
        navigationController?.navigationBar.barTintColor = .lightRed
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancel))
        
    }
    
    fileprivate func setupViews() {
        
    }
    
    
    @objc private func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
