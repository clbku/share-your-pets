# Stage 1: build
FROM node:20-alpine AS builder

# Define build arguments for environment variables
ARG VITE_MAPBOX_TOKEN

# Set environment variables during the build process
ENV VITE_MAPBOX_TOKEN=$VITE_MAPBOX_TOKEN

# Set working directory
WORKDIR /app

# Copy package manifests
COPY package.json pnpm-lock.yaml ./

# Enable corepack and ensure pnpm is available
RUN --mount=type=cache,id=pnpm,target=/root/.local/share/pnpm/store \
    npm i --global --no-update-notifier --no-fund pnpm@latest-8

# Install dependencies (try frozen lockf
RUN --mount=type=cache,id=pnpm,target=/root/.local/share/pnpm/store \
    pnpm install -r --prod

# Copy source
COPY . .

# Build the app
RUN pnpm run build


# Stage 2: production image
FROM nginx:stable-alpine

# Copy built assets from builder
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy a minimal nginx config to serve SPA (fallback to /index.html)
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;' "]
