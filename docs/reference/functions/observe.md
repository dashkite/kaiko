---
order: 1
---
# observe

_Function_ &bull; Listen for logging events.

<pre><code>observe handler &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|handler|[`Function`][Function]|The logging event handler.|
|&rarr; logger|[`Logger`][Logger]|The default logger.|


## Description

Listen for logging events for the default logger using the given handler, which should accept a loggering event as an argument.


[Function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function
[Logger]: /reference/types/logger/index.md