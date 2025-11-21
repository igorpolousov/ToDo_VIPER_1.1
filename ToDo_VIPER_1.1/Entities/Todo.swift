//
//  Todo.swift
//  ToDo_VIPER_1.1
//
//  Created by Igor Polousov on 21.11.2025.
//

import Foundation

// Сруктура для получения данных по сети
struct Todo: Identifiable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

extension Todo: Decodable {
    private enum CodingKeys: CodingKey {
        case id
        case todo
        case completed
        case userId
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? container.decode(Int.self, forKey: .id)
        let rawTodo = try? container.decode(String.self, forKey: .todo)
        let rawCompleted = try? container.decode(Bool.self, forKey: .completed)
        let rawUserId = try? container.decode(Int.self, forKey: .userId)
        
        guard let id = rawId,
              let todo = rawTodo,
              let completed = rawCompleted,
              let userId = rawUserId else {throw ErrorHandler.missingData}
        
        self.id = id
        self.todo = todo
        self.completed = completed
        self.userId = userId
    }
}
