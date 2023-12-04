import * as _ from "@dashkite/joy"
import { inspect, chunks, write as _write } from "./helpers"

class Event

  @create: ({id, context, timestamp, level, data}) ->
    _.assign (new Event), { id, context, timestamp, level, data }

  inspect: -> { @id, @context, @timestamp, @level, data: inspect @data }

levels =
  trace: 0
  debug: 1
  info: 2
  warn: 3
  error: 4
  fatal: 5

class Logger

  @create: ->

    _.assign (new Logger),
      id: 0
      stack: [ [ "root" ] ]
      events: []
      handlers: []
      level: "error"

  _.mixin @::, [

    _.getters
      current: -> _.last @stack

  ]

  log: _.curry _.rtee (level, data) ->
    if levels[level] >= levels[@level]
      event = Event.create {
        id: @id++
        context: @current
        timestamp: _.milliseconds()
        level
        data
      }
      @events.push event
      handler event for handler in @handlers
      @events.shift() if @limit? && @events.length > @limit

  push: _.chain (name) ->
    context = Array.from @current
    context.push name
    @stack.push context

  pop: _.chain -> @stack.pop(); @

  context: _.chain (name, f) ->
    @push name
    if (_.isPromise (r = f()))
      r.then => @pop
    else
      @pop()

  clear: _.chain ->
    @events = []
    @stack = [ [ "root" ] ]
    @id = 0

  observe: _.chain (f) -> @handlers.push f

  unobserve: _.chain (f) -> _.remove f, @handlers

  get: -> inspect @events

  toJSON: -> JSON.stringify @get(), null, 2

  write: (stream) ->
    for chunk from (chunks JSON.stringify @get(), null, 2)
      await _write stream, chunk
    stream

  pipe: _.chain (stream) ->
    @observe (event) ->
      await _write stream, JSON.stringify (inspect event), null, 2

  fatal: _.proxy "log", [ "fatal" ]

  error: _.proxy "log", [ "error" ]

  warn: _.proxy "log", [ "warn" ]

  info: _.proxy "log", [ "info" ]

  debug: _.proxy "log", [ "debug" ]

  trace: _.proxy "log", [ "trace" ]

Logger.default = Logger.create()

export default Logger.default
export { Logger }
