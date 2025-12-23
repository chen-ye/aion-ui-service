# aion-ui-service

A Docker-based service for running the AION UI application in a containerized environment. This service builds and runs the AionUi web application as a service, making it easy to deploy and manage.

## Description

AION UI is a modern web application built with Node.js and Electron. This repository provides Docker configuration to containerize and run the AION UI webui in a production-ready environment. The service handles all dependencies and configurations automatically through Docker.

### Features

- **Containerized Deployment**: Runs AION UI in a Docker container for consistent environments
- **Persistent Storage**: Uses Docker volumes to maintain user data across container restarts
- **Automatic Restart**: Configured to restart unless explicitly stopped
- **Port Exposure**: Exposes port 25808 for web access
- **Dependencies Included**: All system dependencies for native module compilation are pre-installed

## Prerequisites

- Docker
- Docker Compose

## Installation & Setup

1. Clone this repository:
```bash
git clone https://github.com/chen-ye/aion-ui-service.git
cd aion-ui-service
```

2. Build and run using Docker Compose:
```bash
docker-compose up -d
```

This command will:
- Build the Docker image using the provided Dockerfile
- Pull and clone the latest AION UI application
- Install all Node.js dependencies
- Start the service on port 25808

## Usage

### Access the Application

Once the service is running, access the AION UI application at:
```
http://localhost:25808
```

### Managing the Service

**Start the service:**
```bash
docker-compose up -d
```

**Stop the service:**
```bash
docker-compose down
```

**View logs:**
```bash
docker-compose logs -f aionui
```

**Restart the service:**
```bash
docker-compose restart aionui
```

## Configuration

The service is configured with the following settings:

- **Port**: 25808 (mapped from container port 25808)
- **Volume**: `aionui_data` - Persistent storage for user configuration and data at `/root/.config/AionUi`
- **Restart Policy**: `unless-stopped` - Automatically restarts on failure

## Data Persistence

User data and configuration files are stored in the Docker volume `aionui_data`, which persists between container restarts. This includes:
- User preferences
- Configuration files
- Application data

To access or backup the data:
```bash
docker volume inspect aionui_data
```

## Advanced Usage

### Building the Image Manually

If you need to build the Docker image separately:
```bash
docker build -t aionui:latest .
```

### Running with Custom Configuration

To modify environment variables or other settings, edit the `docker-compose.yml` file before running the service.

## Architecture

The Docker image is built on:
- **Base Image**: Node.js 22 (Bookworm)
- **Source**: Built from the official [AionUi repository](https://github.com/iOfficeAI/AionUi)
- **Entrypoint**: Runs `npm run webui:prod:remote` to start the web UI service

## Troubleshooting

### Port Already in Use
If port 25808 is already in use, modify the port mapping in `docker-compose.yml`:
```yaml
ports:
  - "YOUR_PORT:25808"
```

### Container Won't Start
Check the logs to diagnose the issue:
```bash
docker-compose logs aionui
```

### Persist Data Issues
Ensure the volume is properly created:
```bash
docker volume ls | grep aionui
```

## License

This is a wrapper/service configuration for the AION UI project. Please refer to the original [AionUi repository](https://github.com/iOfficeAI/AionUi) for licensing information.

## Support

For issues related to this Docker service, please open an issue in this repository.
For issues related to AION UI itself, please visit [https://github.com/iOfficeAI/AionUi](https://github.com/iOfficeAI/AionUi).