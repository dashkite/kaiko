---
order: 1
---
# fatal

_Function_ &bull; Log a value using the _fatal_ log level.

<pre><code>fatal value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value in the context of a fatal error. Returns the value being logged, which allows `log` to be used as a combinator. Convenience for `log "fatal", value`.

