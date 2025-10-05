# What's in this directory?
- ./buildDocker: This command will build the docker container from scratch
- ./createPacketTracer: Given the ./buildDocker has created the image, this will start the container the first time.
- ./runPacketTracer: After the frst time the container has been created, this will connect to the container every time. 
