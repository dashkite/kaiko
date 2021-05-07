# unobserve

_Method_ &bull; Remove a logging event listener.

<pre><code>logger.unobserve&nbsp;handler &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|handler|[`Function`][Function]|The logging event handler.|
|&rarr; logger|[`Logger`][Logger]|The default logger.|


## Description

Remove _handler_ as a listener for logging events.


[Logger]: /reference/types/logger/index.md
[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function