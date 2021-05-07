# info

_Function_ &bull; Log a value using the _info_ log level.

<pre><code>info value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value for informational purposes. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for `log "info", value`.

