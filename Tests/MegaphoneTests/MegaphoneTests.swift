//
//  MegaphoneTests.swift
//  MegaphoneTests
//
//  Copyright (c) 2019 Jason Nam (https://jasonnam.com)
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

import XCTest
@testable import Megaphone

final class MegaphoneTests: XCTestCase {

    private var megaphone: Megaphone!

    override func setUp() {
        super.setUp()
        megaphone = .init()
    }

    func testAddObserver() {
        let notificationName = Notification.Name(rawValue: "testAddObserver")

        megaphone.addObserver(forName: notificationName)

        let expectation = self.expectation(description: "Observe test notification")

        let observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: .main) { _ in
            expectation.fulfill()
        }

        megaphone.post(name: notificationName)

        waitForExpectations(timeout: 1, handler: nil)

        NotificationCenter.default.removeObserver(observer)
    }

    func testRemoveObserver() {
        let notificationName = Notification.Name(rawValue: "testRemoveObserver")

        megaphone.addObserver(forName: notificationName)

        let expectation = self.expectation(description: "Should not observe test notification")
        expectation.isInverted = true

        let observer = NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: .main) { _ in
            expectation.fulfill()
        }

        megaphone.removeObserver(withName: notificationName)

        megaphone.post(name: notificationName)

        waitForExpectations(timeout: 1, handler: nil)

        NotificationCenter.default.removeObserver(observer)
    }

    func testRemoveAllObservers() {
        let notificationName1 = Notification.Name(rawValue: "testRemoveAllObservers1")
        let notificationName2 = Notification.Name(rawValue: "testRemoveAllObservers2")

        megaphone.addObserver(forName: notificationName1)
        megaphone.addObserver(forName: notificationName2)

        let expectation1 = expectation(description: "Should not observe test notification 1")
        expectation1.isInverted = true
        let expectation2 = expectation(description: "Should not observe test notification 2")
        expectation2.isInverted = true

        let observer1 = NotificationCenter.default.addObserver(forName: notificationName1, object: nil, queue: .main) { _ in
            expectation1.fulfill()
        }
        let observer2 = NotificationCenter.default.addObserver(forName: notificationName2, object: nil, queue: .main) { _ in
            expectation2.fulfill()
        }

        megaphone.removeAllObservers()

        megaphone.post(name: notificationName1)
        megaphone.post(name: notificationName2)

        waitForExpectations(timeout: 1, handler: nil)

        NotificationCenter.default.removeObserver(observer1)
        NotificationCenter.default.removeObserver(observer2)
    }
}
