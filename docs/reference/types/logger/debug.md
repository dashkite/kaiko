# debug

_Method_ &bull; Log a value using the _debug_ log level.

<pre><code>logger.debug&nbsp;value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value for debugging purposes. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for:

```coffeescript
logger.log "debug", value`
```


[Logger]: /reference/types/logger/index.md