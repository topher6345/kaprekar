# Kaprekar

A gem to explore [Kaprekar's routine](http://en.wikipedia.org/wiki/6174_(number))

[Video on the Kapreka's routine](http://youtu.be/d8TRcZklX_Q)

usage:
```bash
kaprekar 1234
```

The number `6174` has a very interesting property.


### Kaprekar's routine

Start with any 4-digit, positive integer with unique digits 
`1234`

Sort the number's digits highest to lowest
`4321`

Sort the number's digits lowest to highest

`1234`

Subtract the low-high from the high-low

`4321 - 1234`

take the result and iterate again over the alogirhtm

you will terminate eventually at `6174`

This gem walks you through the process.
