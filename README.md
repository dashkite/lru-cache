# LRU Cache

*A simple Map-based Least Recently Used cache for JavaScript.*

[![Hippocratic License HL3-CORE](https://img.shields.io/static/v1?label=Hippocratic%20License&message=HL3-CORE&labelColor=5e2751&color=bc8c3d)](https://firstdonoharm.dev/version/3/0/core.html)

The LRU Cache library provides a caching mechanism built upon the standard JavaScript `Map` object. It automatically evicts the least recently accessed items when the cache reaches its maximum capacity to bound memory usage.

## Features

- Built entirely on the native JavaScript `Map` object.
- Automatically discards the least recently used entries to maintain a bounded memory footprint.
- Includes a `memoize` helper function to add caching to function calls.
- Adopts a flexible interface that allows creators to provide their own underlying `Map` implementation.

## Installation

```bash
pnpm install @dashkite/lru-cache
```

## Usage

You can create a new cache instance and interact with it using a familiar, map-like interface.

```coffeescript
import { LRUCache } from "@dashkite/lru-cache"
import assert from "assert"

cache = new LRUCache new Map, 100

cache.set "greeting", "hello"
assert.equal "hello", cache.get "greeting"
```

You can also use the `memoize` function to wrap existing functions, giving them automatic caching behavior.

```coffeescript
import { memoize } from "@dashkite/lru-cache"
import assert from "assert"

expensiveFunction = ( input ) ->
  # perform slow computation here
  input * 2

fastFunction = memoize expensiveFunction

assert.equal 4, fastFunction 2
```

## Other Resources

- [Reference Documentation](docs/reference.md)
- [Usage Guides](docs/recipes.md)
- [Technical Notes](docs/technical-notes.md)
- [Testing](docs/testing.md)