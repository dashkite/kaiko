# log

_Method_ &bull; Log a value.

<pre><code>logger.log&nbsp;level,&nbsp;value &rarr; value</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|level|[`String`][String]|The logging level.|
|value|any|The value to log.|
|&rarr; value|any|The value logged.|


## Description

Log a value at a given logging level. Returns the value being logged, which allows `log` to be used as a combinator.


[Logger]: /reference/types/logger/index.md
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String