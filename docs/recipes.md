# Usage Guides

## Memoizing a computation

Creators frequently need to avoid redundant processing or network requests. The `memoize` function provides a way to cache the results of a function call based on its input, preventing recalculations.

**Example**

```coffeescript
import { memoize } from "@dashkite/lru-cache"

# data fetching operation
fetchUserData = ( id ) ->
  # ... network request logic ...
  return { id, name: "Alice" }

cachedFetch = memoize fetchUserData
data = cachedFetch 123
```

**Algorithm**

1. Create a function that takes an input and returns a result.
2. Pass this function into the `memoize` helper.
3. Call the resulting wrapped function instead of your original function. The wrapper will check the internal cache for the input and return the stored result if it exists. Otherwise, it will execute the original function and store the result for future calls.

## Bounding memory growth with a custom cache

Long-running applications can suffer from memory exhaustion if a cache grows indefinitely. The `LRUCache` class enables developers to cap the maximum number of items held in memory, dropping the oldest data when the limit is reached.

**Example**

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"

cache = new LRUCache new Map, 500

processItem = ( key, data ) ->
  # ... parse and prepare data ...
  cache.set key, data

# ... process many items over time ...
recentData = cache.get "latest-item"
```

**Algorithm**

1. Instantiate an `LRUCache`, providing a standard `Map` and a specific numeric limit for the maximum capacity.
2. Use the `set` method to store values into the cache as they are created or loaded.
3. As the application continues to run, the cache will discard the least recently accessed keys to stay within the provided capacity limit.
