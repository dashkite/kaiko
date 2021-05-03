# Kaikō

*A logging runtime for JavaScript*

```coffeescript
import * as log from "@dashkite/kaiko"

foo = (bar) ->
  log.push "foo"
  log.info bar
  # do something ...
  log.warn "uh-oh"
  # do some other things ...
  log.pop "foo"
```

Later, you can write the log as rich JSON (meaning the objects JSON normally ignores are converted into values it can serialize for reference purposes):

```coffeescript
log.write process.stdout
```

From there, you can pipe the output to a tool like [fx][].

```bash
npm test | fx
```

[fx]: https://github.com/antonmedv/fx

Or, if you’re in the browser, just access the JSON:

```coffeescript
log.toJSON()
```

or just log it directly to the console:

```coffeescript
log.toConsole()
```

## Reference

### create

`create name → logger`

Create a logger. Usually unnecessary, since there is a default global logger that’s provided for you. However, for application-specific uses, you can create a dedicated instance. 

### push

`push logger, name → context`

`push name → context`

Create a new logging context and push it onto the logging stack. If no logger is given, uses the default logger.

### pop

### context

`context logger, name, function → context`

`context name, function → context`

Pushes a logging context, executes the given functions, and pops it, returning the context. Convenience for pushing and popping a context.

### log

### fatal

### error

### warn

### info

### debug

### trace

### write

### level

### limit

### toJSON

### toConsole

### observe

