//
//  Todos.swift
//  ToDo_VIPER_1.1
//
//  Created by Igor Polousov on 21.11.2025.
//

import Foundation

struct Todos: Decodable {
    // Для получение всех объектов Todo по сети
    private(set) var todos: [Todo]
}
