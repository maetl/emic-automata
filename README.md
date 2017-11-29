# Emic Automata

This is a computer-generated book produced for [NaNoGenMo 2017](https://github.com/NaNoGenMo/2017).

## Notes

The book is generated using elementary cellular automata with two randomly selected units of text mapped to the binary states of each cell.

The starting automaton is seeded with a randomly selected list of states. This seed is used to generate a wall of text—a study of repetition and contrast which combines the universal pattern generated by the automaton with the particular visual density of the selected units of text.

The number of cells in each generation and the number of generations are dependent on the length of the selected units. For this to work, the selected units must be the exact same length and the output text must be set in a monospace font.

## Source Material

- [Corpus of 466k English words](https://github.com/dwyl/english-words)
- [The 88 inequivalent elementary cellular automata](https://en.wikipedia.org/wiki/Elementary_cellular_automaton#Random_initial_state)

## Tools

- [Ruby 2.4](https://ruby-lang.org)
- [Calyx](http://calyx-rb.org/)
- [Prawn](https://github.com/prawnpdf/prawn)
- [PNG](https://rubygems.org/gems/png)

## License

The MIT License (MIT)

Copyright © 2017 Mark Rickerby <https://maetl.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
