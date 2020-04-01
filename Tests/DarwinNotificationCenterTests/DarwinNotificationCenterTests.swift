//
//  DarwinNotificationCenterTests.swift
//  DarwinNotificationCenterTests
//
//  Copyright (c) 2019 - 2020 Jason Nam (https://jasonnam.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

@testable import DarwinNotificationCenter
import XCTest

final class DarwinNotificationCenterTests: XCTestCase {

    override func tearDown() {
        super.tearDown()
        DarwinNotificationCenter.default.removeAllObservers()
    }

    func testAddObserver() {
        let notificationName = "testAddObserver"

        let expectation = self.expectation(description: "Observe test notification")

        DarwinNotificationCenter.default.addObserver(forName: notificationName) { name in
            XCTAssertEqual(name, notificationName)
            expectation.fulfill()
        }

        DarwinNotificationCenter.default.post(name: notificationName)

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testRemoveObserver() {
        let notificationName = "testRemoveObserver"

        let expectation = self.expectation(description: "Should not observe test notification")
        expectation.isInverted = true

        DarwinNotificationCenter.default.addObserver(forName: notificationName) { _ in
            expectation.fulfill()
        }

        DarwinNotificationCenter.default.removeObserver(withName: notificationName)

        DarwinNotificationCenter.default.post(name: notificationName)

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testRemoveAllObservers() {
        let notificationName1 = "testRemoveAllObservers1"
        let notificationName2 = "testRemoveAllObservers2"

        let expectation1 = expectation(description: "Should not observe test notification 1")
        expectation1.isInverted = true
        let expectation2 = expectation(description: "Should not observe test notification 2")
        expectation2.isInverted = true

        DarwinNotificationCenter.default.addObserver(forName: notificationName1) { _ in
            expectation1.fulfill()
        }
        DarwinNotificationCenter.default.addObserver(forName: notificationName2) { _ in
            expectation2.fulfill()
        }

        DarwinNotificationCenter.default.removeAllObservers()

        DarwinNotificationCenter.default.post(name: notificationName1)
        DarwinNotificationCenter.default.post(name: notificationName2)

        waitForExpectations(timeout: 1, handler: nil)
    }
}
