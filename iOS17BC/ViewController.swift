//
//  ViewController.swift
//  iOS17BC
//
//  Created by Pratik Patel on 2/12/2023.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        refresh()
    }
    
    @objc func refresh() {
        refreshControl?.beginRefreshing()
    }
}

