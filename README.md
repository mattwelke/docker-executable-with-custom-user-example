# docker-executable-with-custom-user-example

An example for how to build a Dockerfile where it executes a file, but the user executing it is not the root user. See `Dockerfile` for details.

To build and run the image:

```bash
./build.sh && docker run --rm docker-executable-with-custom-user-example
```

Example output:

```
...
Hello, World! I am myuser
```

## Note on Alpine

When making the example as minimal as possible, I switched from Ubuntu to Alpine for a small image size. When I did that, I had to remove `#!/bin/bash` from the top of the `hello.sh` script and change the Dockerfile's `ENTRYPOINT` line from `ENTRYPOINT [ "./hello.sh" ]` to `ENTRYPOINT [ "sh", "hello.sh" ]`. This is because Alpine uses sh instead of Bash, which can't execute executables using the `./<executable>` syntax.
