#!/bin/bash

echo "Building image of zshlab..."

docker build -f Dockerfile -t zshlab ../.

echo "Starting container using zshlab..."

# Start the container in detached mode
docker run -d \
    --rm \
    --hostname zshlab \
    --name zshlab \
    -v "$(pwd)/cache/pacman/":/var/cache/pacman/pkg/ \
    -v "$(pwd)/cache/yay/":/var/cache/yay/ \
    -v "$(pwd)/home":/home/zshtester \
    -v "$(pwd)/root":/root/ \
    -it zshlab

# Wait briefly to ensure the container is fully started
sleep 2

# Get the container's root filesystem path on the host
CONTAINER_ROOT_PATH=$(docker inspect -f '{{ .GraphDriver.Data.MergedDir }}' zshlab)

# Mount the container's root filesystem to a local folder
HOST_MOUNT_DIR="$(pwd)/zshlab-root"
mkdir -p "$HOST_MOUNT_DIR"
sudo mount --bind "$CONTAINER_ROOT_PATH" "$HOST_MOUNT_DIR"
sudo chown -R $USER $HOST_MOUNT_DIR

echo "Container root filesystem mounted to $HOST_MOUNT_DIR"
echo "You can edit the container's root filesystem from this directory."

# Attach to the container (optional, or you can leave it detached)
docker attach zshlab

# Unmount the container root filesystem when exiting the script
echo "Unmounting container root filesystem..."
sudo umount "$HOST_MOUNT_DIR"

