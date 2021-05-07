# error

_Method_ &bull; Log a value using the _error_ log level.

<pre><code>logger.error&nbsp;value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value in the context of an error. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for:

```coffeescript
logger.log "error", value`
```


[Logger]: /reference/types/logger/index.md