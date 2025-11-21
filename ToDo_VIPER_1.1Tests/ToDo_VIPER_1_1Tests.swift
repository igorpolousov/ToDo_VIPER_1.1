//
//  ToDo_VIPER_1_1Tests.swift
//  ToDo_VIPER_1.1Tests
//
//  Created by Igor Polousov on 14.11.2025.
//

import XCTest
@testable import ToDo_VIPER_1_1

final class ToDo_VIPER_1_1Tests: XCTestCase {
    
    // MARK: Properties
    // Декодер для тестирования Todo
    var decoder: JSONDecoder!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        decoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        decoder = nil
    }
    
    // MARK: Entities tests
    
    // Testing struct Todo decodes JSON
    func testingTodoDecodesJSON() throws {
        let decoded = try decoder.decode(Todo.self, from: testTodoData)
        
        XCTAssertEqual(decoded.id, 1)
        XCTAssertEqual(decoded.completed, false)
        XCTAssertEqual(decoded.todo, "Do something nice for someone you care about")
        XCTAssertEqual(decoded.userId, 152)
    }
    
    // Testing struct Todos decodes JSON
    
    func testingTodosDecodesJSON() throws {
        let decoded =  try decoder.decode(Todos.self, from: testTodosData)
        
        // Проверяем количество полученных объектов в массив
        XCTAssertEqual(decoded.todos.count, 6)
        
        // Делаем проверку обекта под индексом 3 на соотвествие данным
        XCTAssertEqual(decoded.todos[3].id, 4)
        XCTAssertEqual(decoded.todos[3].completed, false)
        XCTAssertEqual(decoded.todos[3].todo, "Watch a documentary")
        XCTAssertEqual(decoded.todos[3].userId, 84)
        
    }
    
    // Testing ErrorHandler shows missing data error description
    func testingErrorHAndlerShowMessageMissingData() throws {
        let missingDataDescrioption = ErrorHandler.missingData.errorDescription
        
        XCTAssertEqual(missingDataDescrioption, "Missing valid data/Отсутствуют необходимые данные" )
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
