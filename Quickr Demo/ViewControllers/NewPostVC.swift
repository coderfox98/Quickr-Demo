//
//  NewPostVC.swift
//  Quickr Demo
//
//  Created by Rishabh Raj on 19/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NewPostVC : UIViewController {
    
    let titleTextField = QDTextField(placeholderText: "Enter Title")
    
    let categoryTextField = QDTextField(placeholderText: "Enter Category")
    
    let descTextField = QDTextField(placeholderText: "Enter Short Description")
    
    let postButton = QDButton(titleText: "Post")
    
    
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
        view.addSubview(titleTextField)
        view.addSubview(categoryTextField)
        view.addSubview(descTextField)
        view.addSubview(postButton)
        
        postButton.addTarget(self, action: #selector(handlePost), for: .touchUpInside)
        
        let inset : CGFloat = 16
        
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: inset, paddingRight: inset, height: 50, width: 0)
        
        categoryTextField.anchor(top: titleTextField.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: inset, paddingRight: inset, height: 50, width: 0)
        
        descTextField.anchor(top: categoryTextField.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: inset, paddingRight: inset, height: 50, width: 0)
        
        postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        postButton.anchor(top: descTextField.bottomAnchor, bottom: nil, left: nil, right: nil, paddingTop: 2 * inset, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, height: 50, width: 175)
        
        
    }
    
    @objc private func handlePost() {
        
        let ref = Database.database().reference().child("posts").childByAutoId()
        
        let values = ["title": titleTextField.text!, "category" : categoryTextField.text!,"description" : descTextField.text!]
        
        ref.setValue(values) { (error, ref) in
            if let error = error {
                print("Failed to post to database",error.localizedDescription)
            }else {
                
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    
    @objc private func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
