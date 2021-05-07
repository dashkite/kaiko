# push

_Method_ &bull; Push a new logging context.

<pre><code>logger.push&nbsp;name &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|name|[`String`][String]|The name of the logging context.|
|&rarr; logger|[`Logger`][Logger]|The default logger.|


## Description

Create a new logging context and push it onto the logging stack.


[Logger]: /reference/types/logger/index.md
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String