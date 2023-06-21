# Pulsar 

The original Juno team decided to join forces with the [Julia extension for VSCode](https://github.com/julia-vscode/julia-vscode). As such, the Atom-based plugin has been in a “maintenance-only mode” for many years.

I'm attempting to bring this up to date to make it work well under the new [Pulsar-edit](https://pulsar-edit.dev) editor. At the moment this involves mostly bumping dependencies.

To get started, install the [uber-juno](https://github.com/JunoLab/uber-juno) package in Pulsar, it will likely fail to install the `julia-client` package, you should hopefully be able to install that from [my fork](https://github.com/mjrodgers/atom-julia-client).

----

[![Docs](https://img.shields.io/badge/docs-latest-blue.svg)](https://JunoLab.github.io/JunoDocs.jl/latest)
[![CI](https://github.com/JunoLab/Atom.jl/workflows/CI/badge.svg)](https://github.com/JunoLab/Atom.jl/actions?query=workflow%3ACI)
[![codecov](https://codecov.io/gh/JunoLab/Atom.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JunoLab/Atom.jl)

This is the language server backend for [Juno](http://junolab.org/), the [Julia](http://julialang.org/) IDE.

The frontend for certain exposed functionality (getting input, showing a selector widget etc.) is provided via [Juno.jl](https://github.com/JunoLab/Juno.jl), which is a much more lightweight (and pure Julia) dependency.

For documentation on how the communication between client and server is handled, head on over to the [developer documentation at atom-julia-client](https://github.com/JunoLab/atom-julia-client/blob/master/docs/communication.md).


## Note for developers

If any method signature has been added/changed after you modify the code base,
it's better to add test cases against it and then update [the precompilation file](./src/precompile.jl)
using [SnoopCompile.jl](https://github.com/timholy/SnoopCompile.jl) against the test script,
so that we can obtain better first time invocation of those methods.

To update the precompilation file, you just need to run the following command:

> at the root of this package directory

```bash
λ julia --project=. --color=yes scripts/generate_precompile.jl
```
