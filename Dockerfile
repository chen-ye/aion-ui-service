# Use Node.js LTS (Bookworm)
FROM node:22-bookworm

# Install system dependencies
# - git: to clone the repo
# - python3, make, g++, gcc: for building native modules (better-sqlite3)
# - Electron runtime dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    make \
    g++ \
    gcc \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libpangocairo-1.0-0 \
    libxss1 \
    libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone the repository
# We clone a specific version or main branch. Since no version was specified, we clone main/default.
RUN git clone https://github.com/iOfficeAI/AionUi .

# Install dependencies
# unsafe-perm might be needed for some post-install scripts when running as root,
# though usually fine in modern npm.
RUN npm install

# Expose the application port
EXPOSE 25808

# Define volume for persistence (User Data directory)
# Electron stores user data in ~/.config/AionUi by default on Linux
VOLUME ["/root/.config/AionUi"]

# Start the application
CMD ["npm", "run", "webui:prod:remote"]
