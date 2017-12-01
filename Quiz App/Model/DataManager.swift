//
//  DataManager.swift
//  Quiz App
//
//  Created by Vadim Shoshin on 30.11.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

final class DataManager {
    static let instance = DataManager()
    private init() {}
    
    var сategoriesArray: [Category] = []
    var questionsForCategories: [Int: Question] = [:]
    
    func loadCategories() {
        Alamofire.request("https://qriusity.com/v1/categories/").responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonObj = JSON(value)
                guard let jsonArray = jsonObj.array else { return }
                for jsonObject in jsonArray {
                    guard let category = Category(json: jsonObject) else { continue }
                    self.сategoriesArray.append(category)
                }
                print(self.сategoriesArray)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCategory(indexPath: IndexPath) -> Category? {
        return сategoriesArray[indexPath.row]
    }
}
