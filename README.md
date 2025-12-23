# AionUi Docker Service

This repository provides a Dockerized setup for running [AionUi](https://github.com/iOfficeAI/AionUi) as a standalone web service.

## 🚀 Quick Start

### Prerequisites

- Docker
- Docker Compose

### Running Locally

1.  Clone this repository.
2.  Start the service:

    ```bash
    docker-compose up -d
    ```

3.  Access the WebUI at `http://localhost:25808`.

The application data is persisted in a Docker volume named `aionui_data`.

## 📦 GitHub Actions & Container Registry

This repository includes a GitHub Action workflow (`.github/workflows/docker-publish.yml`) that automatically builds and pushes the Docker image to the **GitHub Container Registry (GHCR)** whenever you push to the `main` branch.

### Configuration for Pushing to GHCR

**Do you need to do any repo config?**
Generally, **no**. The included workflow is configured to use the automatic `GITHUB_TOKEN` with the necessary write permissions:

```yaml
permissions:
  contents: read
  packages: write
```

However, please ensure the following:

1.  **Actions Enabled**: Ensure GitHub Actions are enabled in your repository (`Settings` > `Actions` > `General`).
2.  **Package Creation**: The first time the workflow runs, it will create a new package in your personal/organization profile linked to this repository. You must have permission to create packages in the namespace.
3.  **Visibility**: By default, packages published from a private repository are private. You can change the package visibility in the "Packages" section of your profile/organization settings.

### Using the Image

Once built, you can pull the image using:

```bash
docker pull ghcr.io/YOUR_USERNAME/YOUR_REPO_NAME:latest
```
