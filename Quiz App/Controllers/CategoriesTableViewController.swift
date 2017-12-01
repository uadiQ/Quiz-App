//
//  CategoriesTableViewController.swift
//  Quiz App
//
//  Created by Vadim Shoshin on 30.11.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.instance.loadCategories()
        tableView.reloadData()
    }

    private func getCategory(for indexPath: IndexPath) -> Category {
        guard let categoryToLoad = DataManager.instance.getCategory(indexPath: indexPath) else {fatalError("Category with wrong indexPath")}
        return categoryToLoad
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.instance.сategoriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell else { fatalError("Cell with wrong identifier") }
        
        let category = getCategory(for: indexPath)
        cell.update(category)
        tableView.reloadData()
        return cell
    }

}
