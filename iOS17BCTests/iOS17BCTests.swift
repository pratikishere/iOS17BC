//
//  iOS17BCTests.swift
//  iOS17BCTests
//
//  Created by Pratik Patel on 2/12/2023.
//

import XCTest
@testable import iOS17BC

final class iOS17BCTests: XCTestCase {

    /*
     Making this window `key` window is globally affecting the host application.What if we're running tests without a Host Application, such as in a framework? It wouldn't work since you cannot make the window `key` without a Host Application!
     */
    /*
    func test_refreshControl_solutionOne() {
        let sut = ViewController()
        
        sut.loadViewIfNeeded() // viewDidLoad
        XCTAssertEqual(sut.refreshControl?.isRefreshing, false)
        
        let window = UIWindow()
        window.rootViewController = sut
        window.makeKeyAndVisible()
        RunLoop.current.run(until: Date() + 0.3)
        
        XCTAssertEqual(sut.refreshControl?.isRefreshing, true)
        
        sut.refreshControl?.endRefreshing()
        sut.refreshControl?.sendActions(for: .valueChanged)
        XCTAssertEqual(sut.refreshControl?.isRefreshing, true)
    }
     */
    
    func test_refreshControl() {
        let sut = ViewController()
        
        sut.simulateAppreance()
        XCTAssertEqual(sut.refreshControl?.isRefreshing, true)
        
        sut.refreshControl?.endRefreshing()
        XCTAssertEqual(sut.refreshControl?.isRefreshing, false)
        
        sut.simulatePullToRefresh()
        XCTAssertEqual(sut.refreshControl?.isRefreshing, true)
        
        sut.refreshControl?.endRefreshing()
        sut.simulateAppreance()
        XCTAssertEqual(sut.refreshControl?.isRefreshing, false)
    }
}

private extension ViewController {
    func simulatePullToRefresh() {
        refreshControl?.sendActions(for: .valueChanged)
    }
    
    func simulateAppreance() {
        if !isViewLoaded {
            loadViewIfNeeded() // viewDidLoad
            replaceRefreshControlWithFakeForiOS17Support()
        }
        beginAppearanceTransition(true, animated: false) // viewWillAppear
        endAppearanceTransition() // viewIsAppearing + viewDidAppear
    }
    
    func replaceRefreshControlWithFakeForiOS17Support() {
        let fake = FakeUIRefreshControl()
        
        refreshControl?.allTargets.forEach { target in
            refreshControl?.actions(forTarget: target, forControlEvent: .valueChanged)?.forEach { action in
                fake.addTarget(target, action: Selector(action), for: .valueChanged)
            }
        }
        
        refreshControl = fake
    }
}

private class FakeUIRefreshControl: UIRefreshControl {
    private var _isRefreshing = false
    
    override var isRefreshing: Bool { _isRefreshing }
    
    override func beginRefreshing() {
        _isRefreshing = true
    }
    
    override func endRefreshing() {
        _isRefreshing = false
    }
}
