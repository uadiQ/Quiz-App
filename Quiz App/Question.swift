//
//  Question.swift
//  Quiz App
//
//  Created by Vadim Shoshin on 30.11.2017.
//  Copyright © 2017 Vadim Shoshin. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Question {
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    let id: Int
    let answer: Int
}
