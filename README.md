# tilt helpers

A collection of [Tilt](https://tilt.dev) semi-reusable helpers for my projects.

## Usage

```py
v1alpha1.extension_repo('eb', url='https://github.com/ericbutera/tilt')
v1alpha1.extension(name='go_helper', repo_name='eb', repo_path='extensions/go_helper')
load('ext://go_helper', 'go_compile', 'go_image')
```

## Helpers

Prerequisites:

Load extension repo

```py
v1alpha1.extension_repo('eb', url='https://github.com/ericbutera/tilt')
```

### Go

```py
v1alpha1.extension(name='go_helper', repo_name='eb', repo_path='extensions/go_helper')
load('ext://go_helper', 'go_compile', 'go_image')
go_compile('worker-compile', './cmd/worker', ['./cmd/worker']) # build app
go_image('worker', './cmd/worker') # inject app into image
```

### [golang-migrate](./extensions/golang-migrate/)

```py
DSN = "postgres://postgres:password@timescaledb:5432/postgres?sslmode=disable"
v1alpha1.extension(name='golang-migrate', repo_name='eb', repo_path='extensions/golang-migrate')
load('ext://golang-migrate', 'golang_migrate')
golang_migrate(dsn=DSN, resource_deps=['timescaledb'])
```

### [Postgres](./extensions/postgres/)

```py
v1alpha1.extension(name='postgres', repo_name='eb', repo_path='extensions/postgres')
load('ext://postgres', 'postgres')
postgres()
```

### [NATS](./extensions/nats/)

```py
v1alpha1.extension(name='nats', repo_name='eb', repo_path='extensions/nats')
load('ext://nats', 'nats')
nats()
```

### [Redis](./extensions/redis/)

```py
v1alpha1.extension(name='redis', repo_name='eb', repo_path='extensions/redis')
load('ext://redis', 'redis')
redis()
```

### [Redpanda](./extensions/redpanda/)

```py
v1alpha1.extension(name='redpanda', repo_name='eb', repo_path='extensions/redpanda')
load('ext://redpanda', 'redpanda')
redpanda()
```

### [Timescale](./extensions/timescaledb/)

```py
v1alpha1.extension(name='timescaledb', repo_name='eb', repo_path='extensions/timescaledb')
load('ext://timescaledb', 'timescaledb')
timescaledb(port_forwards='15432:5432')
```
