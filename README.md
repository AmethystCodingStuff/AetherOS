# AetherOS

A simple **.NET 7** console app containerized with Docker.

## Build & Run locally

```powershell
docker build -t aetheros:latest .
docker run --rm aetheros:latest
```

## Push the image to GitHub Container Registry

```powershell
docker tag aetheros:latest ghcr.io/AmethystCodingStuff/aetheros:latest
docker push ghcr.io/AmethystCodingStuff/aetheros:latest
```

## Release

Tags are used for releases. Example: `v0.1.0`.

```
git tag v0.1.0
git push origin v0.1.0
```

> Feel free to create a release on GitHub with the tag.
