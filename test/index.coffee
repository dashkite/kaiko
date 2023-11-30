import assert from "assert"
import {print, test, success} from "amen"
import * as _ from "@dashkite/joy"

import { PassThrough } from "stream"

import * as $ from "../src"

do ->

  print await test "Kaikō", [

    test "log", ->
      $.level "info"
      assert.deepEqual foo: "bar", $.log "info", foo: "bar"
      log = $.get()
      assert.equal true, _.isArray log
      assert.deepEqual [ "root" ], log[0].context
      assert.equal 0, log[0].id
      assert.equal "info", log[0].level
      assert.equal true, log[0].timestamp?
      assert.deepEqual {foo: "bar"}, log[0].data

    test "push/pop", ->
      $.clear()
      $.level "info"
      $.log "info", foo: "bar"
      $.push "foo"
      $.log "info", foo: "bar"
      $.pop()
      log = $.get()
      assert.equal true, _.isArray log
      assert.deepEqual [ "root", "foo" ], log[1].context
      assert.equal 1, log[1].id
      assert.equal "info", log[1].level
      assert.equal true, log[1].timestamp?
      assert.equal true, log[1].timestamp > log[0].timestamp
      assert.deepEqual {foo: "bar"}, log[1].data

    test "context", ->
      $.clear()
      $.level "info"
      $.log "info", foo: "bar"
      $.context "foo", ->
        $.log "info", foo: "bar"
      log = $.get()
      assert.equal true, _.isArray log
      assert.deepEqual [ "root", "foo" ], log[1].context

    test "strictly equal context", ->
      $.clear()
      $.level "info"
      $.log "info", foo: "baz"
      $.log "info", foo: "baz"
      log = $.get()
      assert.equal log[0].context, log[1].context

    test "log based on level", ->
      $.clear()
      $.level "error"
      assert.deepEqual foo: "baz", $.info foo: "baz"
      assert.equal false, $.get()[0]?

    test "log limit", ->
      $.clear()
      $.level "info"
      $.limit 5

      for n in [1..7]
        $.log "info", foo: "bar"
        if n > 5
          assert.equal 5, $.get().length
        else
          assert.equal n, $.get().length

    test "toJSON", ->
      $.clear()
      $.level "info"
      $.log "info", foo: "bar"
      assert.deepEqual $.get(), JSON.parse $.toJSON()

    test "observe", ->
      $.clear()
      $.level "info"
      event = undefined
      $.observe (_event) -> event = _event
      $.log "info", foo: "bar"
      assert.equal true, event?

    test "unobserve", ->
      $.clear()
      $.level "info"
      event = undefined
      f = (_event) -> event = _event
      $.observe f
      $.unobserve f
      $.log "info", foo: "bar"
      assert.equal false, event?

    test "curry log", ->
      logger = $.create()
      # console.log logger.error foo: "bar"
      $.clear()
      z = ""
      f = (x) -> z += x
      g = _.pipe [
        f
        logger.error()
        f
      ]
      g "a"
      assert.equal "aa", z
      assert.equal 1, logger.get().length

    await test "write", ->
      $.clear()
      $.level "info"
      $.limit 10000
      for i in [1..10000]
        $.log "info", foo: "bar"
      result = ""
      mockStream = new PassThrough
      mockStream.on "data", (data) -> result += data
      await $.write mockStream
      assert.equal $.toJSON(), result

    test "circular references", ->
      $.clear()
      $.level "info"
      foo = {}
      bar = {foo}
      foo.bar = bar
      $.info foo
      assert.equal "...", $.get()[0].data.bar.foo
  ]

  process.exit if success then 0 else 1
