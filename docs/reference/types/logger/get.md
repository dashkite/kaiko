# get

_Method_ &bull; Return the logged events as a serializable array.

<pre><code>logger.get &rarr; events</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][Logger]|An instance of Logger|
|&rarr; events|[`Array`][Array]|An array of serializable events.|


## Description

Return the logged events as an array that can be serialized using `JSON.stringify`. Circular references are replaced with the value `...`.


[Logger]: /reference/types/logger/index.md
[Array]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array