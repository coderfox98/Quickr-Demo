//
//  ViewController.swift
//  Quickr Demo
//
//  Created by Rishabh Raj on 19/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeVC: UIViewController{
    
    var posts = [Post]()
    
    let homeTableVCCellID = "homeTableVCCellID"
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        setupNavBar()
        
        setupTableView()
        
        setupViews()
        
      
        
    }
    
    fileprivate func setupNavBar() {
        view.backgroundColor = .lightBlue
        
        
        navigationController?.navigationBar.barTintColor = .lightRed
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddPost))
        
    }
    
    fileprivate func setupViews() {
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, height: 0, width: 0)
    }
    
    

    @objc func handleAddPost() {
        
        let navVC = UINavigationController(rootViewController: NewPostVC())
        
        present(navVC, animated: true, completion: nil)
        
    }
    
     func fetchPosts() {

        self.posts.removeAll()
        let ref = Database.database().reference().child("posts")
        ref.observe(.value) { (snapshot) in
            //            print(snapshot)
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                print(snap.key)

                let dict = snap.value as! [String : Any]
                let title = dict["title"] as! String
                let category = dict["category"] as! String
                let description = dict["description"] as! String
                
                self.posts.append(Post(title: title, category: category, description: description))
                DispatchQueue.main.async {
                    self.tableView.reloadData()

                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         let ref = Database.database().reference().child("posts")
        ref.removeAllObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         fetchPosts()
    }
    
  
}

extension HomeVC :  UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setupTableView() {
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: homeTableVCCellID)
        tableView.delegate = self
        tableView.dataSource = self
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeTableVCCellID, for: indexPath) as! HomeTableViewCell
        cell.titleHeadingLabel.text = posts[indexPath.item].title
        cell.categoryLabel.text = posts[indexPath.item].category
        cell.descLabel.text = posts[indexPath.item].description
        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}



