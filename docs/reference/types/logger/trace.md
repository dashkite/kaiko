# trace

_Method_ &bull; Log a value using the _trace_ log level.

<pre><code>logger.trace&nbsp;value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value for purposes of tracing program flow. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for:

```coffeescript
logger.log "trace", value`
```


[Logger]: /reference/types/logger/index.md