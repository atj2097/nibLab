//
//  progrommaticCellsTests.swift
//  progrommaticCellsTests
//
//  Created by God on 10/11/19.
//  Copyright © 2019 God. All rights reserved.
//

import XCTest
@testable import progrommaticCells

class progrommaticCellsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    


        var user = [User]()
        guard let path = Bundle.main.path(forResource: "A", ofType: "json") else{
            print("No path to json")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            var test = [User]()
           UsersFetchingService.manager.getUsers(completionHandler: {(result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let userFromOnline):
                        test = userFromOnline
                    case .failure(let error):
                        print(error)
                    }
                }
            })
            XCTAssert(test.count == 500 , "We have \(test.count) users")
        }
        catch {
            print(error)
            XCTFail()
        }
        
    }
}


