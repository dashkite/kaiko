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

## Installation

```shell
npm i @dashkite/kaiko
```
