---
order: 1
---
# pipe

_Function_ &bull; Pipe events to a stream as JSON.

<pre><code>pipe stream &rarr; logger</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|stream|[`Stream`][Stream]|The stream to which to write the events.|
|&rarr; logger|[`Logger`][Logger]|The target logger.|


## Description

Pipe logged events for the default logger to a stream as JSON.


[Stream]: #
[Logger]: /reference/types/logger/index.md