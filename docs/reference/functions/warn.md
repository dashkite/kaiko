---
order: 1
---
# warn

_Function_ &bull; Log a value using the _warn_ log level.

<pre><code>warn value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value as a warning. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for `log "warn", value`.

