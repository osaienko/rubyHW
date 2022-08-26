# Playing around with ruby in intellij.

Takeaways from NIX Core Ruby overview https://www.youtube.com/watch?v=IcZ_V4wTGpU&list=PLImoByoc5oUxSkVmgb8cUTRXVixxLLPui&ab_channel=ArtemZatsepa

`irb` in terminal - active Ruby console to try things out.

`snake_case` - ✅
`camelCase` - ❌

print statements: `puts` aka `println`, `print`, `p` (best for 'debugging')

`'` and `"` are different for strings, both can be used.
Interpolation: `"works in double quoted strings: #{1 + 2}."`

Constants defined with `UPPER_CASE`, still can be overridden.

String concatenation is doe with both `+` and `<<`, not sure what the difference is atm.

Comments: `#` and TODO: multiline comment?

Ruby does not require `;` (madness)

The spaceship operator will return `1`, `0`, or `−1` depending on the value of the left argument relative to the right argument.
```
a <=> b :=
if a < b then return -1
if a = b then return  0
if a > b then return  1
if a and b are not comparable then return nil
```
### Methods
Methods in Ruby always return something, "void" returns `nil`.