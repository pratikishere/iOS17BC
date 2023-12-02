//
//  ViewController.swift
//  iOS17BC
//
//  Created by Pratik Patel on 2/12/2023.
//

import UIKit

class ViewController: UITableViewController {
    
    private var onViewIsAppearing: ((ViewController) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        onViewIsAppearing = { vc in
            vc.refresh()
            vc.onViewIsAppearing = nil
        }
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        onViewIsAppearing?(self)
    }
    
    @objc func refresh() {
        refreshControl?.beginRefreshing()
    }
}

