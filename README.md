# Homework Grid LaTeX document class

LaTeX document class for making a homework planner. This is the successor to
[AgendaCreator](https://github.com/psvenk/AgendaCreator/).

## Directory structure

Each release has its own subdirectory, under which `data` contains an example
usage file. Each `data` subdirectory, apart from the example usage file and a
symlink to the document class, is ignored by Git, so you can keep your homework
grid files there if you choose.

## Versioning

This project does **not** use semantic versioning and, as such, breaking changes
may appear in any release. It is incumbent upon the user to review any such
changes (typically by reading the changelog and seeing how the example usage
file has changed) before upgrading to a newer version of `hwgrid.cls`. This also
means that older homework grid `.tex` files may not work with newer versions of
`hwgrid.cls`, which is why I keep each version in a dedicated subdirectory with
its own `data` directory.

I am aware that this is not the best way to handle versioning, but this is a
holdover from when I first started this project mainly as something for my
personal use.

## Contributing

Contributions are always welcome. Please make your changes in the `devel`
directory and write descriptive messages in your commit(s) and pull request.

## License

SPDX-License-Identifier: MIT

Copyright (c) 2019-20 psvenk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
