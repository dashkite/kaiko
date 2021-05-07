---
order: 1
---
# toJSON

_Function_ &bull; Return the logged events as JSON.

<pre><code>toJSON &rarr; json</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|&rarr; json|[`String`][String]|A JSON representation of the events.|


## Description

Return the logged events for the default logger as JSON. Circular references are replaced with the value `...`.


[String]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String