Even with using entrypoint+command in the exec form (list) cf [this doc](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact),
It s not possible to both override an image entrypoint, and its CMD (entry point args) via cli...

no overrides, everything works
```
docker run --rm testep 1 2 3 4
1 2 3 4
```

override via python code, no luck
```
Using python SDK to test list entrypoint
wrapped
=> SHOULD be:
wrapped
1 2 3 4
```

via compose, no more luck
```
docker-compose run --rm testep 1 2 3 4
wrapper
=> SHOULD be:
wrapped
1 2 3 4
```


