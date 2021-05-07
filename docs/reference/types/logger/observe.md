# observe

_Method_ &bull; Listen for logging events.

<pre><code>logger.observe&nbsp;handler &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|handler|[`Function`][Function]|The logging event handler.|
|&rarr; logger|[`Logger`][Logger]|The default logger.|


## Description

Listen for logging events using the given handler, which should accept a loggering event as an argument.


[Logger]: /reference/types/logger/index.md
[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function