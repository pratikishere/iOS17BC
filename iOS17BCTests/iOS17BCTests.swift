//
//  iOS17BCTests.swift
//  iOS17BCTests
//
//  Created by Pratik Patel on 2/12/2023.
//

import XCTest
@testable import iOS17BC

final class iOS17BCTests: XCTestCase {

    func test_refreshControl() {
        let sut = ViewController()
        
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.refreshControl?.isRefreshing, true)
        
        sut.refreshControl?.endRefreshing()
        sut.refreshControl?.sendActions(for: .valueChanged)
        XCTAssertEqual(sut.refreshControl?.isRefreshing, true)
    }
}
