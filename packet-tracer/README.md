# What's in this directory?
- ./buildDocker: This command will build the docker container from scratch
- ./createPacketTracer: Given the ./buildDocker has created the image, this will start the container the first time.
- ./runPacketTracer: After the frst time the container has been created, this will connect to the container every time. 


# Use on Distrobox

- podman build -t <image-name> .
- distrobox create --name <container-name> --image localhost/<image-name>
- distrobox enter <container-name>

> [!NOTE]
> The new version of Packet Tracer 9.0 does not require an external browser to login,
> its possible to use the integrated browser. The integrated browser can be activated in the
> home page going in advanced settings
