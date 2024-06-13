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
