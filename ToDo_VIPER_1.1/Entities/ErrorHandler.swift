//
//  ErrorHandler.swift
//  ToDo_VIPER_1.1
//
//  Created by Igor Polousov on 21.11.2025.
//

import Foundation

enum ErrorHandler: Error {
    // Ошибки получения данных по сети
    case missingData
}

extension ErrorHandler: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return "Missing valid data/Отсутствуют необходимые данные"
        }
    }
    
}
