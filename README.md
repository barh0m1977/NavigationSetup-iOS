# NavigationSetup

An easy, reusable way to set up navigation in a SwiftUI iOS app using a centralized `Router` + `NavigationPath`, plus demos of the other common navigation styles (Push, Sheet, Full Screen, Tab).

## Project structure

```
NavigationSetup/
├── NavigationSetupApp.swift              # App entry point, attaches the router
├── ContentView.swift                     # Root view, triggers navigation via Router
├── Navigation/
│   ├── Router.swift                      # Observable router: holds the NavigationPath + routes
│   └── RouterViewModifier.swift          # Wraps a view in NavigationStack + injects the Router
└── View/
    ├── Home.swift
    ├── ProfileView.swift
    ├── SearchView.swift
    └── NavigationStyleView/
        ├── NavigationContent.swift       # Shared container used by the demo screens
        ├── Push/PushNavigationDemo.swift
        ├── Sheet/SheetNavigationDemo.swift
        ├── FullScreen/FullScreenNavigationDemo.swift
        └── Tab/TabNavigationDemo.swift
```

## How it works (path-based navigation)

This setup uses SwiftUI's `NavigationStack(path:)` driven by a single source of truth: a `Router` object holding a `NavigationPath`. Any view can push/pop by calling methods on `router` — no `NavigationLink` wiring needed.

### 1. Define your routes — `Navigation/Router.swift`

```swift
import SwiftUI
import Observation

enum Route: Hashable {
    case search
    case Home
    case Profile
}

@Observable
class Router {
    var path = NavigationPath()

    func navigateToSearch() {
        path.append(Route.search)
    }

    func navigateToHome() {
        path.append(Route.Home)
    }

    func navigateToProfile() {
        path.append(Route.Profile)
    }

    // Pop back to the root
    func popUpStack() {
        path.removeLast(path.count)
    }
}
```

### 2. Map each route to a screen — `Navigation/RouterViewModifier.swift`

```swift
import SwiftUI

struct RouterViewModifier: ViewModifier {
    @State private var router = Router()

    private func routeView(for route: Route) -> some View {
        Group {
            switch route {
            case .Home:
                Home()
            case .search:
                SearchView()
            case .Profile:
                ProfileView()
            }
        }
    }

    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .environment(router)
                .navigationDestination(for: Route.self) { route in
                    routeView(for: route)
                }
        }
    }
}

extension View {
    func withRouter() -> some View {
        modifier(RouterViewModifier())
    }
}
```

### 3. Attach the router once, at the app root — `NavigationSetupApp.swift`

```swift
import SwiftUI

@main
struct NavigationSetupApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().withRouter()
        }
    }
}
```

### 4. Navigate from any child view

Because `Router` is injected into the environment by `withRouter()`, every descendant view can read it and trigger navigation without passing bindings down the view tree.

```swift
import SwiftUI

struct ContentView: View {
    @Environment(Router.self) var router

    var body: some View {
        VStack {
            Button("Home") {
                router.navigateToHome()
            }
            Button("Search") {
                router.navigateToSearch()
            }
            Button("Profile") {
                router.navigateToProfile()
            }
        }
        .padding()
    }
}
```

To add a new destination:

1. Add a case to `Route` in `Router.swift`.
2. Add a `navigateToX()` helper (or just call `path.append(Route.x)` directly).
3. Map the new case to its view in `RouterViewModifier.routeView(for:)`.

## Other navigation styles included

The app also demos the other common SwiftUI navigation patterns, each self-contained under `View/NavigationStyleView/`:

### Push (`NavigationLink`) — `Push/PushNavigationDemo.swift`

```swift
struct PushNavigationDemo: View {
    var body: some View {
        NavigationStack {
            NavigationContent(title: "Push", color: .black) {
                NavigationLink("Home") {
                    Home()
                }
            }
        }
    }
}
```

### Sheet (modal) — `Sheet/SheetNavigationDemo.swift`

```swift
struct SheetNavigationDemo: View {
    @State var sheetState: Bool = false

    var body: some View {
        NavigationContent(title: "Sheet", color: .mint) {
            Button("sheet") { sheetState.toggle() }
        }
        .sheet(isPresented: $sheetState) {
            Home()
                .presentationDetents([.medium, .large])
        }
    }
}
```

### Full screen + Router — `FullScreen/FullScreenNavigationDemo.swift`

```swift
struct FullScreenNavigationDemo: View {
    @Environment(Router.self) var router

    var body: some View {
        NavigationContent(title: "FullScreen", color: .black) {
            Button("Go Home") {
                router.navigateToHome()
            }
        }
    }
}
```

### Tab — `Tab/TabNavigationDemo.swift`

```swift
struct TabNavigationDemo: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") { Home() }
            Tab("Search", systemImage: "magnifyingglass") { SearchView() }
            Tab("Profile", systemImage: "person") { ProfileView() }
        }
    }
}
```

## Requirements

- iOS 17+ (uses the `@Observable` macro from the `Observation` framework)
- Swift 5.9+ / Xcode 15+

## Quick start (copy into a new project)

1. Copy the `Navigation/` folder into your project.
2. Define your screens and add cases to `Route` in `Router.swift`.
3. Map each `Route` case to a view in `RouterViewModifier.swift`.
4. Wrap your root view with `.withRouter()` in your `App` struct.
5. Inject `@Environment(Router.self) var router` in any view and call `router.navigateToX()`.
