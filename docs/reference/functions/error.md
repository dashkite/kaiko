---
order: 1
---
# error

_Function_ &bull; Log a value using the _error_ log level.

<pre><code>error value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value in the context of an error. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for `log "error", value`.

