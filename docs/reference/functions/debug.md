# debug

_Function_ &bull; Log a value using the _debug_ log level.

<pre><code>debug value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value for debugging purposes. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for `log "error", value`.

