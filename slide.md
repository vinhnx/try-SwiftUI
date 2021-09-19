---
marp: true
class: invert
---

# Introduction to SwiftUI
![](https://developer.apple.com/assets/elements/icons/swiftui/swiftui-96x96.png)

---

# SwiftUI

> SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and as little code as possible
> - https://developer.apple.com/xcode/swiftui/

---

+ SwiftUI is the most exciting news since Apple announce Swift in 2014.

+ SwiftUI lets you ignore Interface Builder (IB) and storyboards without having to write detailed step-by-step instructions for layout out your UI.

---

+ It's easier to write UI in code, compared to XML.

+ It's take less code than UIKit, so it's easy to understand, editing and debug

+ Writing code in SwiftUI is much faster and easider to reason in a new WSYIWYG editor (What You See Is What You Get).

+ Declarative: "what it should be on certain state", the mutated state will be reflected automaticallly in the UI

---

+ Also, SwiftUI makes it really easy to create a modern apps that confirms to Human Design Guidelines by default and provides easier support for accessibility

+ SwiftUI doesn't replace UIKit, you can use both in the same app. The SwiftUI APIs are consistent across platforms, so it will be eaiser to develop on multiple (Apple) platforms using the same source code on each.

+ SwiftUI is not: "write once, run anywhere", more like "learn once, write anywhere (on the Apple platforms)

---

# Availability

iOS 13.0+
macOS 10.15+
Mac Catalyst 13.0+
tvOS 13.0+
watchOS 6.0+

---

# Delcarative syntax

SwiftUI uses a **declarative** syntax, so you can **simply state what your user interface should do**.

```swift
import SwiftUI

struct ContentView: View {
    @State private var query: String = ""

    var body: some View {
        VStack(alignment: .center) {
            TextField("placeholder...", text: $query)
            Text(query)
        }
    }
}
```

---

A Label:

+ UIKit
```swift
let label = UILabel()
label.text = "Hello!"
return label
```

+ SwiftUI
```swift
Text("Hello")
```

---

A list of items

+ UIKit
```swift
let tableView = UITableView()
...
tableView.delegate = self
tableView.datasource = self
...
tableView.reloadData()
...
numberOfRows...
...
cellForRow(at indexPath:...)
```

+ SwiftUI
```swift
@State private var items = [Item]()

List(items, id: \.self) { item in
    Text(item.title)
}
```

---

# App

> A type that represents the structure and behavior of an app.
> - https://developer.apple.com/documentation/swiftui/app

Create an app by declaring a structure that confirms to the `App` protocol.

---

# App

```swift
@main
struct MyApp: App {
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            SomeView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            if newScenePhase == .background {
                // app is now in background
            }
        }
    }
}
```

---

+ `@main`: annotate the to indicate that MyApp conforms toe the App protocol and provides the entry point of the app. Provides a default implementation of the `main()` method that the system calls to launch the app.
+ `Scene`: life cycle of the app 

Read more about `Scene` protocol: https://developer.apple.com/documentation/swiftui/scene

---

# View
> "A type that represents part of your app’s user interface and provides modifiers that you use to configure views."
> - https://developer.apple.com/documentation/swiftui/view

Declaration
```swift
protocol View
```

---

# View
+ `View` protocol provides a blueprint for functionality.
+ The `View` procotol's main requirement is that comforming types must define a `body` computed property:
```swift
struct SomeView: View {
    var body: some View {

    }
}
```
+ SwiftUI reads the value of this propery any time it needs to update the view.
+ The `View` protocol's secondary requirements is that confirming types must indicate an `associated type` for the `body` property.

---

# View
`some View`

"You don't make an explicit declaration. Instead, you declare the body property as an `opaque type`, using the `some View` syntax, to indicate only that the body's type conforms to `view`. The exact type depends on the `body`'s content, which varies as you edit the body during development. Swift inferes the exact type automatically".

---

this is wrong:
```
var body: some Text {}
```
with this you need to returns explicit `Text` view.

as with`some View`:
```swift
var body: some View {
    VStack {
        Button("A button")
        Text("Hello")
    }
}
```

Views that take multiple input child views, like the stack in the example above, typically do so using a closure marked with the `ViewBuilder` attribute. This enables a multiple-statement closure that doesn’t require additional syntax at the call site. You only need to list the input views.

---

# View Modifier 

Use view modifier to customze the appearance and behavior of `View`s.

```swift
Text("Hello")
    .frame(width: 100)
    .foregroundColor(.green)
```

Configure child views

```swift
VStack {
    Text("Hi")
    Text("Hello")
        .font(.subtitle) // font for this view only
    Text("World")
}
.font(.body) // apply body font for whole VStack
```

---

# Protocol Oriented 


---

# SwiftUI

SwiftUI is all about Value type and Protocol
+ light-weight as View are value type
+ no memory leak and reference cycle
+ cheap vs expensive
+ value type vs reference type
+ no inheritance, conforms to certain traits instead

---

# Combine

SwiftUI is powered by Combine

Reactive programming with Combine

---

# State
@State

@State should be mark as private

@Binding

@State vs @Binding

https://developer.apple.com/documentation/swiftui/binding

@Publish

Publisher with Published

https://developer.apple.com/documentation/combine/published


---

Property Wrapper

---

View Model with `ObserverableObject`

---

SwiftUI <-> UIKit 

+ Use UIKit in SwiftUI view
+ Use SwiftUI views in UIKit

---

Demo

---

# SwiftUI & Jetpack Compose
https://quickbirdstudios.com/blog/swiftui-vs-android-jetpack-compose/

---

```swift
@Composable
fun SomeView() {
    val counter = +state { 0 }

    Center {
        Column {
            Text("count: ${counter.value}")
            Button("Increment", onClick = { counter.value++ })
            Button("Decrement", onClick = { counter.value-- })
        }
    }
}
```

```swift
struct SomeView: View {
    @State private var counter = 0

    var body: some View {
        VStack {
            Text("counter: \(counter)")
            Button("+") { self.counter += 1 }
            Button("-") { self.counter -= 1 }
        }
    }
}
```

---

# References

https://developer.apple.com/tutorials/SwiftUI
https://www.raywenderlich.com/3715234-swiftui-getting-started
https://swiftwithmajid.com
https://www.swiftbysundell.com
https://www.hackingwithswift.com
https://sarunw.com

---

"Learn by doing"

---

Q&A

---

Thank you for your time!
