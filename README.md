# tilt helpers

A collection of [Tilt](https://tilt.dev) semi-reusable helpers for my projects.

## Usage

```py
v1alpha1.extension_repo('eb', url='https://github.com/ericbutera/tilt')
v1alpha1.extension(name='go_helper', repo_name='eb', repo_path='extensions/go_helper')
load('ext://go_helper', 'go_compile', 'go_image')
```

## Helpers

### Go

- `go_build` - Build a local development go binary
- `go_image` - Build a local development docker image
