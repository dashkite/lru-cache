# adapted from https://stackoverflow.com/a/46432113
class LRUCache
  
  constructor: ( @cache = new Map, @max = 1e6 ) ->

  keys: -> Array.from @cache.keys()

  get: ( key ) ->
    if ( result = @cache.get key )?
      # refresh key
      @cache.delete key
      @cache.set key, result
      result
  
  set: ( key, value ) ->
    # refresh key
    if ( @cache.get key )?
      @cache.delete key
    else if @cache.size == @max
      @cache.delete @keys()[0]
    @cache.set key, value

  delete: ( key ) -> @cache.delete key

memoize = ( f ) ->
  do ( cache = new LRUCache ) ->
    ( input ) ->
      if ( result = cache.get input )?
        result
      else
        result = f input
        cache.set input, result
        result

export {
  LRUCache
  memoize
}