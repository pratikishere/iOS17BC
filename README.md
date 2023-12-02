# iOS17BC
After the release of iOS 17 the tests for `UIRefreshControl` are breaking, but the same tests are working below iOS 17 i.e iOS 16 and below. This repo contains an example to create test that works for iOS 13 to iOS 17 for `UIRefreshControl`

[Credit - Essential Developer](https://www.essentialdeveloper.com/articles/fixing-ios-17-breaking-changes-uirefreshcontrol-viewisappearing-testability-ios-dev-mentoring)

New view controller life cycle method has been introduced [viewIsAppearing](https://developer.apple.com/documentation/uikit/uiviewcontroller/4195485-viewisappearing). It is backward compatible to iOS 13+

This method gets call after `viewWillAppear` and before `viewDidAppear` so it is called in-betweeen.

From iOS 13 to iOS 17 we need to move refreshControl?.beginRefreshing() call to `viewIsAppearing` so that it can start loading/animating

In test we could have used `Window` and `RunLoop`, however making the window as `key` window is globally affecting the host application. What if we're running tests without a Host Application, such as in a framework? It wouldn't work since you cannot make the window `key` without a Host Application!

So using `FakeUIRefreshControl` we could test the state of `UIRefreshControl` which supports iOS 13 to iOS 17
