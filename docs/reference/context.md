# context

_Function_ &bull; Run a function within a logging context.

<pre><code>context logger, name, function &rarr; context</code></pre>
<br>
<pre><code>context name, function &rarr; context</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][logger]|The target logger.|
|name|[`String`][string]|The name of the logging context.|
|function|[`Function`][function]|The function to run.|
|&rarr; context|[`Context`][context]|The logging context.|


## Description

Create a new logging context and pushes it onto the logging stack. Runs the given function and pops the stack. If no logger is given, uses the default logger.


[logger]: #
[string]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[function]: #
[context]: /reference//context