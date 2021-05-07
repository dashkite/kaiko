# toJSON

_Method_ &bull; Return the logged events as JSON.

<pre><code>logger.toJSON &rarr; json</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|&rarr; json|[`String`][String]|A JSON representation of the events.|


## Description

Return the logged events as JSON. Circular references are replaced with the value `...`.


[Logger]: /reference/types/logger/index.md
[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String