---
order: 1
---
# create

_Function_ &bull; Create a logger.

<pre><code>create name &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|name|[`String`][String]|The name of the logger.|
|&rarr; logger|[`Logger`][Logger]|The newly created logger.|


## Description

Create a logger. Usually unnecessary, since there is a default global logger that’s provided for you. However, for application-specific uses, you can create a dedicated instance.


[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[Logger]: /reference/types/logger/index.md