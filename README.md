# Nativeblocks iOS SDK

### Initialize

```swift
import Nativeblocks

NativeblocksManager.initialize(
    edition: .cloud(
        endpoint: NATIVEBLOCKS_API_ENDPOINT,
        apiKey: NATIVEBLOCKS_API_KEY,
        developmentMode: true
    )
)
```

### Load view in SwiftUI

```swift
import SwiftUI
import Nativeblocks

NativeblocksFrame(
    route: "/",
    loading: {
        AnyView(NativeblocksLoading())
    },
    error: { message in
        AnyView(NativeblocksError(message: message))
    }
).ignoresSafeArea()
```
