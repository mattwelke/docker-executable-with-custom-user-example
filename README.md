# docker-executable-with-custom-user-example

An example for how to build a Dockerfile where it executes a file, but the user executing it is not the root user. See `Dockerfile` for details.

To build and run the image:

```bash
./build.sh && docker run --rm docker-executable-user-test
```

Example output:

```
[+] Building 0.1s (9/9) FINISHED                                                                                                                                                                                                                          docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                0.0s
 => => transferring dockerfile: 535B                                                                                                                                                                                                                                0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                   0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                     0.0s
 => [1/4] FROM docker.io/library/alpine:latest                                                                                                                                                                                                                      0.0s
 => [internal] load build context                                                                                                                                                                                                                                   0.0s
 => => transferring context: 29B                                                                                                                                                                                                                                    0.0s
 => CACHED [2/4] RUN adduser -D myuser && mkdir -p /home/myuser/bin                                                                                                                                                                                                 0.0s
 => CACHED [3/4] WORKDIR /home/myuser/bin                                                                                                                                                                                                                           0.0s
 => CACHED [4/4] COPY --chown=myuser:myuser hello.sh .                                                                                                                                                                                                              0.0s
 => exporting to image                                                                                                                                                                                                                                              0.0s
 => => exporting layers                                                                                                                                                                                                                                             0.0s
 => => writing image sha256:e5bd2aa3882d7f97f50e315713205cbd385d587b1cb11f297bccb56e8d81e2d9                                                                                                                                                                        0.0s
 => => naming to docker.io/library/docker-executable-user-test                                                                                                                                                                                                      0.0s
Hello, World! I am myuser
```

## Note on Alpine

When making the example as minimal as possible, I switched from Ubuntu to Alpine for a small image size. When I did that, I had to remove `#!/bin/bash` from the top of the `hello.sh` script and change the Dockerfile's `ENTRYPOINT` line from `ENTRYPOINT [ "./hello.sh" ]` to `ENTRYPOINT [ "sh", "hello.sh" ]`. This is because Alpine uses sh instead of Bash, which can't execute executables using the `./<executable>` syntax.
