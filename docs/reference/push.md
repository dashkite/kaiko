# push

_Function_ &bull; Creates a new logging context.

<pre><code>push logger, name &rarr; context</code></pre>
<br>
<pre><code>push name &rarr; context</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][logger]|The target logger.|
|name|[`String`][string]|The name of the logging context.|
|&rarr; context|[`Context`][context]|The logging context.|


## Description

Create a new logging context and push it onto the logging stack. If no logger is given, uses the default logger.


[logger]: #
[string]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[context]: /reference//context