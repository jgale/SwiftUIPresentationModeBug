# SwiftUI presentationMode bug

I was encountering a bug on my app where my `View` displayed in a sheet was getting initialized twice. I was initializing my ViewModel in that view, which was causing all sorts of problems with multiple network requests firing and my views not updating.

Debugger output:
```
init sheet
init sheet
````
I tracked it down to this line in my `ContentView`:

```swift
@Environment(\.presentationMode) var presentation
```

Removing that line solved my problem.

I had initially added it to workaround some other SwiftUI bug but I found a different workaround for that.