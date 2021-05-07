# context

_Method_ &bull; Run a function within a logging context.

<pre><code>logger.context&nbsp;name,&nbsp;function &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|name|[`String`][String]|The name of the logging context.|
|function|[`Function`][Function]|The function to run.|
|&rarr; logger|[`Logger`][Logger]|The target logger.|


## Description

Create a new logging context and pushes it onto the logging stack of a logger. Runs the given function and pops the stack.


[Logger]: /reference/types/logger/index.md
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function