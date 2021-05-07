---
order: 1
---
# get

_Function_ &bull; Return the logged events as a serializable array.

<pre><code>get &rarr; events</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|&rarr; events|[`Array`][Array]|An array of serializable events.|


## Description

Return the logged events for the default logger as an array that can be serialized using `JSON.stringify`. Circular references are replaced with the value `...`.


[Array]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array