# 🐳 Docker Commands for `python-dev`

## Quick Start (Use the scripts!)

```bash
./buildDocker              # Build the image from scratch
./createPythonContainer    # First time: create and run container
./runPythonContainer       # Next times: connect to existing container
```

---

## Tools Included

- **Pixi** - Modern Python package manager
- **Neovim** - Text editor
- **Fish** - Default shell

Use pixi to manage Python packages and environments:
```bash
pixi init
pixi add numpy opencv pytorch
```

---

## Manual Commands (if needed)

Build image:
```bash
docker build -t python-dev:ubuntu22 .
```

Create container (first time):
```bash
xhost +local:
docker run -it -v /home/raffaele/Containers/python:/srv/workspace --name python-dev --env DISPLAY=$DISPLAY --volume /tmp/.X11-unix:/tmp/.X11-unix --privileged python-dev:ubuntu22
```

Reuse container:
```bash
docker start -ai python-dev
```
