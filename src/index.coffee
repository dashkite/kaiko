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
      await write stream, JSON.stringify (inspect event), null, 2

  fatal: _.proxy "log", [ "fatal" ]

  error: _.proxy "log", [ "error" ]

  warn: _.proxy "log", [ "warn" ]

  info: _.proxy "log", [ "info" ]

  debug: _.proxy "log", [ "debug" ]

  trace: _.proxy "log", [ "trace" ]

Logger.default = Logger.create()

create = Logger.create

setter = _.curry (name, value) -> Logger.default[name] = value
level = setter "level"
limit = setter "limit"

bind = (name) -> _.bind Logger::[name], Logger.default
log = bind "log"
fatal = bind "fatal"
error = bind "error"
warn = bind "warn"
info = bind "info"
debug = bind "debug"
trace = bind "trace"
push = bind "push"
pop = bind "pop"
context = bind "context"
clear = bind "clear"
observe = bind "observe"
unobserve = bind "unobserve"
get = bind "get"
toJSON = bind "toJSON"
write = bind "write"
pipe = bind "pipe"

export {
  create
  log
  level
  limit
  fatal
  error
  warn
  info
  debug
  trace
  push
  pop
  context
  clear
  observe
  unobserve
  get
  toJSON
  write
  pipe
}
