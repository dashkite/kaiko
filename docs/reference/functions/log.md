---
order: 1
---
# log

_Function_ &bull; Log a value.

<pre><code>log level, value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|level|[`String`][String]|The logging level.|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value at a given logging level. Returns the value being logged, which allows `log` to be used as a combinator.


[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String