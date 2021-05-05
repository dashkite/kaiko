# create

_Function_ &bull; Create a logger.

<pre><code>create name &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|name|[`String`][string]|The name of the logger.|
|&rarr; logger|[`Logger`][logger]|The newly created logger.|


## Description

Create a logger. Usually unnecessary, since there is a default global logger that’s provided for you. However, for application-specific uses, you can create a dedicated instance.


[string]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[logger]: #