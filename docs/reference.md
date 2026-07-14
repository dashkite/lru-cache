# Reference

## LRUCache

### constructor

$constructor: cache, max \to \text{LRUCache}$

Creates a new LRU Cache instance.

**Example**

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"
import assert from "assert"

cache = new LRUCache new Map, 10
assert.equal 0, cache.keys().length
```

### keys

$keys: \to \text{Array}$

Returns an array of all keys currently in the cache, ordered from least recently used to most recently used.

**Example**

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"
import assert from "assert"

cache = new LRUCache
cache.set "a", 1
cache.set "b", 2
assert.deepEqual [ "a", "b" ], cache.keys()
```

### get

$get: key \to value$

Retrieves a value from the cache by its key. Accessing the key marks it as the most recently used. If the key does not exist, it returns `undefined`.

**Example**

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"
import assert from "assert"

cache = new LRUCache
cache.set "a", 1
assert.equal 1, cache.get "a"
```

### set

$set: key, value \to \text{LRUCache}$

Adds or updates a value in the cache. Setting a key marks it as the most recently used. If adding the new key exceeds the maximum capacity, the least recently used key is evicted. Returns the cache instance to allow for method chaining.

**Example**

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"
import assert from "assert"

cache = new LRUCache new Map, 2
cache.set "a", 1
cache.set "b", 2
cache.set "c", 3
assert.equal undefined, cache.get "a"
assert.equal 2, cache.get "b"
```

### delete

$delete: key \to \text{boolean}$

Removes a specific key from the cache. Returns `true` if the key existed and was removed, or `false` otherwise.

**Example**

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"
import assert from "assert"

cache = new LRUCache
cache.set "a", 1
cache.delete "a"
assert.equal undefined, cache.get "a"
```

### clear

$clear: \to \emptyset$

Removes all keys and values from the cache, resetting it to an empty state.

**Example**

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"
import assert from "assert"

cache = new LRUCache
cache.set "a", 1
cache.clear()
assert.deepEqual [], cache.keys()
```

## memoize

$memoize: function \to function$

Wraps an existing function with a caching layer. The returned function will return cached results for previously seen inputs, rather than re-computing them.

**Example**

```coffeescript
import { memoize } from "@dashkite/lru-cache"
import assert from "assert"

timesCalled = 0
double = ( n ) ->
  timesCalled += 1
  n * 2

fastDouble = memoize double

fastDouble 2
fastDouble 2
assert.equal 1, timesCalled
```
