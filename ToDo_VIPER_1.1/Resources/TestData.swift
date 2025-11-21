//
//  TestData.swift
//  ToDo_VIPER_1.1
//
//  Created by Igor Polousov on 21.11.2025.
//

import Foundation

//Mock data for testing struct Todo 

let testTodoData: Data = """
    {
      "id": 1,
      "todo": "Do something nice for someone you care about",
      "completed": false,
      "userId": 152
    }
""".data(using: .utf8)!
