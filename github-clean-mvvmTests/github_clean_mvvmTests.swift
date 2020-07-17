//
//  github_clean_mvvmTests.swift
//  github-clean-mvvmTests
//
//  Created by HS Lee on 2020/07/10.
//  Copyright © 2020 HS Lee. All rights reserved.
//

import XCTest
@testable import github_clean_mvvm

class VCTest {
    let vc = UIViewController()
    let str = "test"
    lazy var xx: () -> Void = { [vc] in
        print(vc.description)
        //print(self.vc.description)
    }
    
    func run() {
        xx()
    }
    
    func run2() {
        var xxx: () -> Void = {
            print(self.vc.description)
            //print(self.vc.description)
        }
        xxx()
    }
    
    deinit {
        print("\(NSStringFromClass(type(of: self))) deinit")
    }
}

class github_clean_mvvmTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var test: VCTest! = VCTest()
        test.run()
        //test.run2()
        test = nil
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
