---
order: 1
---
# context

_Function_ &bull; Run a function within a logging context.

<pre><code>context name, function &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|name|[`String`][String]|The name of the logging context.|
|function|[`Function`][Function]|The function to run.|
|&rarr; logger|[`Logger`][Logger]|The default logger.|


## Description

Create a new logging context and pushes it onto the logging stack of the default logger. Runs the given function and pops the stack.


[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function
[Logger]: /reference/types/logger/index.md