import * as _ from "@dashkite/joy"
import { inspect, chunks } from "./helpers"

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

  log: (level, data) ->
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
    @

  push: (name) ->
    context = Array.from @current
    context.push name
    @stack.push context
    @

  pop: -> @stack.pop(); @

  get: -> inspect @events

  clear: -> @events = []; @id = 0; @

  toJSON: -> JSON.stringify @get(), null, 2

Logger.default = Logger.create()

level = (value) -> Logger.default.level = value

limit = (n) -> Logger.default.limit = n

log = _.curry (level, object) -> Logger.default.log level, object

fatal = log "fatal"
error = log "error"
warn = log "warn"
info = log "info"
debug = log "debug"
trace = log "trace"

get = -> Logger.default.get()

clear = -> Logger.default.clear()

toJSON = -> Logger.default.toJSON()

push = (name) -> Logger.default.push name

pop = -> Logger.default.pop()

context = (name, f) ->
  push name
  if (_.isPromise (r = f()))
    r.then pop
  else
    pop()

observe = (handler) ->
  Logger.default.handlers.push handler

unobserve = (handler) ->
  _.remove handler, Logger.default.handlers

write = (stream) ->
  resolve = undefined
  for chunk from (chunks JSON.stringify get(), null, 2)
    ready = new Promise (r) -> resolve = r
    stream.write chunk, resolve
    await ready

export {
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
  get
  clear
  observe
  unobserve
  write
  toJSON
}
