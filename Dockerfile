# Use the official Node.js image.
# https://hub.docker.com/_/node
FROM node:18 AS build

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy application code
COPY . .

# Build the Next.js app
RUN npm run build

# Production stage
FROM node:18

# Set working directory
WORKDIR /app

# Install production dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy built assets from the build stage
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public

# Expose port and define the command to run the app
EXPOSE 3000
CMD ["npm", "start"]
