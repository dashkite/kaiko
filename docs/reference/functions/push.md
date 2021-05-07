---
order: 1
---
# push

_Function_ &bull; Creates a new logging context.

<pre><code>push name &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|name|[`String`][String]|The name of the logging context.|
|&rarr; logger|[`Logger`][Logger]|The default logger.|


## Description

Create a new logging context and push it onto the logging stack, using the default logger.


[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[Logger]: /reference/types/logger/index.md