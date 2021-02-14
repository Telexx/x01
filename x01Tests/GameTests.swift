//
//  GameTests.swift
//  x01Tests
//
//  Created by Alec Henderson on 14/02/2021.
//

import XCTest
@testable import x01
class GameTests: XCTestCase {

    override func setUpWithError() throws {

        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let player1 = Player(name: "Alec Henderson", startingScore: 501)
        let player2 = Player(name: "Sophie Mansell", startingScore: 501)
        
        _ = Game(opponentType: .computer, startingScore: 501, players: [player1,player2])
        
        
        player1.addScore(score: 27)
        player1.addScore(score: 66)
        player1.addScore(score: 35)
        print(player1.average)
        dump(player1.scores)
        XCTAssertTrue(player1.average == 42)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
