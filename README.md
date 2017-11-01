# Docgen

A short script which _tries_ to generate [Dash docsets](https://kapeli.com/dash) from Python libraries.

Spits out `lib_name.docset` which you can cmd-click to install into Dash.

Requirements:

- `pip install doc2dash sphinx`
- The library's source is available on GitHub
- The library keeps its docs in `docs/`
  - with a make target called `html`
  - which outputs to `_build`
  - where the repository's name is the name of the docset

These are all common practice, but I'm not making any guarantees.

Example:

```docgen.sh requests/requests```
