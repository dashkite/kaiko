---
order: 1
---
# unobserve

_Function_ &bull; Remove a logging event listener.

<pre><code>unobserve handler &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|handler|[`Function`][Function]|The logging event handler.|
|&rarr; logger|[`Logger`][Logger]|The default logger.|


## Description

Remove _handler_ as a listener for logging events for the default logger.


[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function
[Logger]: /reference/types/logger/index.md