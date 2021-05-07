# fatal

_Method_ &bull; Log a value using the _fatal_ log level.

<pre><code>logger.fatal&nbsp;value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value in the context of a fatal error. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for:

```coffeescript
logger.log "fatal", value`
```


[Logger]: /reference/types/logger/index.md