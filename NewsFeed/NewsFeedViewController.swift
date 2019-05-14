//
//  ViewController.swift
//  NewsFeed
//
//  Created by Subham on 14/05/19.
//  Copyright © 2019 Subham. All rights reserved.
//

import UIKit
import Foundation

class NewsFeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    
    var newsFeedArray: [ArticleAndCreator] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.rowHeight = UITableView.automaticDimension
        newsFeedArray = Utility.shared.readJSON()?.data ?? []
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension NewsFeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedType1TableViewCell", for: indexPath) as! FeedType1TableViewCell
        cell.configure(model: newsFeedArray[indexPath.row])
        return cell
    }
}
