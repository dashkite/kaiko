# pop

_Function_ &bull; Pops the context stack.

<pre><code>pop logger &rarr; context</code></pre>
<br>
<pre><code>pop &rarr; context</code></pre>
<br>

| name | type | description |
|------|------|-------------|
|logger|[`Logger`][logger]|The target logger.|
|&rarr; context|[`Context`][context]|The logging context.|


## Description

Pops the current context from the default logger's context stack, returning the context that was removed.


[logger]: #
[context]: /reference/types/logger/context