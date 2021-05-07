# trace

_Function_ &bull; Log a value using the _trace_ log level.

<pre><code>trace value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value for purposes of tracing program flow. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for `log "trace", value`.

