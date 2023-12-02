# iOS17BC
When iOS 17 was released the tests for `UIRefreshControl` are breaking, but the same tests are working below iOS 16

[Credit - Essential Developer](https://www.essentialdeveloper.com/articles/fixing-ios-17-breaking-changes-uirefreshcontrol-viewisappearing-testability-ios-dev-mentoring)

New view controller life cycle method has been introduced [viewIsAppearing](https://developer.apple.com/documentation/uikit/uiviewcontroller/4195485-viewisappearing). It is backward compatible to iOS 13+
