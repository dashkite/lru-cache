# Technical Notes

### Caching Strategy

The `LRUCache` class implements a Least Recently Used eviction strategy relying entirely on the insertion order properties of the native JavaScript `Map` object. Because standard maps maintain key insertion order, iterating over the map's keys consistently yields the oldest (first inserted) items first. When an existing key is accessed via `get` or updated via `set`, the class explicitly deletes and re-inserts the key, moving it to the end of the iteration order. This preserves the LRU property without requiring complex linked list structures or timestamp tracking.

### Complexity

Because standard `Map` operations operate in constant time complexity, the overall time complexity of `get`, `set`, and `delete` within `LRUCache` remains $\text{O}(1)$. Specifically, the eviction process during a `set` operation requires fetching the first key from the `keys()` iterator and subsequently deleting it, both of which are constant time operations. The space complexity is $\text{O}(n)$ where $n$ is the configured maximum capacity of the cache.
