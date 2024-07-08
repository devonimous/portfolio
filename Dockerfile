# Use Node.js 18.x LTS (or another version >= v18.17.0)
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of your application code
COPY . .

# Build the application
RUN npm run build


CMD [ "npm", "start" ]
