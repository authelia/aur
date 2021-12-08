[logo]: https://github.com/authelia/authelia/raw/master/docs/images/authelia-title.png "Authelia"
[![alt text][logo]](https://www.authelia.com/)

# authelia/aurpackager
[![Docker Pulls](https://img.shields.io/docker/pulls/authelia/aurpackager.svg)](https://hub.docker.com/r/authelia/aurpackager/) [![Docker Stars](https://img.shields.io/docker/stars/authelia/aurpackager.svg)](https://hub.docker.com/r/authelia/aurpackager/)

This custom image is based on the `archlinux:latest` to provide an Arch Build System to support the continuous deployment function for Authelia's AUR packages.
The image will be re-built if any updates are made to the base `archlinux:latest` image.

## Usage

Here are some example snippets to help you get started utilising this container.

### docker

```
docker run \
  --rm \
  --name=aurpackager \
  -v <path to data>/authelia:/build \
  authelia/aurpackager \
  bash -c "cd /build && updpkgsums"
```

```
docker run \
  --rm \
  --name=aurpackager \
  -v <path to data>/authelia:/build \
  authelia/aurpackager \
  bash -c "cd /build && makepkg --printsrcinfo >| .SRCINFO"
```

```
docker run \
  --rm \
  --name=aurpackager \
  -v <path to data>/authelia:/build \
  authelia/aurpackager \
  bash -c "cd /build && makedeb"
```

## Version
- **08/12/2021:** Remove makedeb-makepkg
- **16/09/2021:** Update for buildx usage
- **10/09/2021:** Replace makedeb-alpha with makedeb and add Buildkite configuration
- **23/06/2021:** Add makedeb
- **19/02/2020:** Initial release