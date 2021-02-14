//
//  LoginSpec.swift
//  x01Tests
//
//  Created by Alec Henderson on 12/02/2021.
//

import XCTest
@testable import x01
class LoginSpec: XCTestCase {

    var viewModel : LoginViewModel!
    var mockFirebase : FirebaseProtocol!
    override func setUpWithError() throws {
        viewModel = .init(firebase: mockFirebase)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
