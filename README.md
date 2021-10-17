# visck shortcuts

An alternate of [vis-digraph(1)](https://martanne.github.io/vis/man/vis-digraph.1.html)

# usage

Same as vis-digraph:  Enter a digraph listed in the second column of
[`keyboard`](https://github.com/9fans/plan9port/blob/master/lib/keyboard)
to get its unicode output in the corresponding third column.
 
# license

- `keyboard` file: [plan9port license](https://github.com/9fans/plan9port/blob/master/LICENSE)
- `shortcuts.lua`: same as vis

# installation

```
$ cp shortcuts.lua keyboard ~/.config/vis/plugins
# and edit visrc.lua to include
require('plugins/shortcuts')
```

# bugs

- overrides `C-k` shortcut of vis-diagraph (set `lua/plugins/digraph.lua`)
- does not match vis-digraph(1) exit status
- location of data file (`keyboard`) is hardcoded to `~/.config/vis/plugins`  
- off-by-one $NF in keyboard not corrected
