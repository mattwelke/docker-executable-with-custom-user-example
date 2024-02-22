# Use a small, secure base image if possible, like Alpine.
FROM alpine

# Add a user "myuser" and create the working directory in one command to avoid creating additional layers.
RUN adduser -D myuser && mkdir -p /home/myuser/bin
WORKDIR /home/myuser/bin

# Copy the executable and change its ownership to "myuser" in one step.
COPY --chown=myuser:myuser hello.sh .

# Use the user "myuser" for running the container.
USER myuser

# Specify the entrypoint script.
ENTRYPOINT [ "sh", "hello.sh" ]
