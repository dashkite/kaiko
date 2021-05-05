import * as _ from "@dashkite/joy"

# adapted from browser verson at: https://stackoverflow.com/a/49544338
getArguments = (func) ->
  FUNC_ARGS = /^(function)?\s*[^\(]*\(\s*([^\)]*)\)/m
  FUNC_ARG_SPLIT = /,/
  FUNC_ARG = /^\s*(_?)(.+?)\1\s*$/
  STRIP_COMMENTS = /((\/\/.*$)|(\/\*[\s\S]*?\*\/))/mg
  ((func ? '')
      .toString()
      .replace(STRIP_COMMENTS, '')
      .match(FUNC_ARGS) ? [ '', '', '' ])[2]
    .split(FUNC_ARG_SPLIT)
    .map((arg) ->
      arg
        .replace FUNC_ARG, (all, underscore, name) ->
          name.split('=')[0].trim())
    .filter String

[ cache, clear ] = do (cache = new Map) ->
  [
    (f) ->
      (value) ->
        if cache.has value
          cache.get value
        else
          cache.set value, (r = f value)
          r

    -> cache.clear()
  ]

_inspect = _.generic
  name: "inspect"
  description: "inspect a value"
  default: (value) -> value.toString?() ? JSON.stringify value

_.generic _inspect, _.isUndefined, -> "undefined"

_.generic _inspect, (_.isKind Object), cache (object) ->
  if object.inspect?
    object.inspect()
  else
    result =
      type: object.constructor.name
      properties: {}
    for key, value of object
      result.properties[key] = inspect value
    result

_.generic _inspect, _.isObject, cache (object) ->
  result = {}
  for key, value of object
    result[key] = inspect value
  result

_.generic _inspect, _.isIterable, cache (it) ->
  (inspect item) for item from it

_.generic _inspect, _.isFunction, cache (f) ->
  name: if f.name == "" then "anonymous" else f.name
  arguments: getArguments f

_.generic _inspect, _.isString, _.identity

inspect = (value) ->
  clear()
  _inspect value

chunks = (text, size = 8192) ->
  i = 0
  j = Math.ceil text.length / size
  while i < j
    yield text.substr(i++ * size, size)

export { inspect, chunks }
