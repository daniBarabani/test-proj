# Use the official Node.js image as the base image.
FROM node:20

# Set the working directory inside the container.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available).
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of the application code.
COPY . .

# Build the React application for production.
RUN npm run build

# Install a simple server to serve the build files.
RUN npm install -g serve

# Expose the port the app runs on.
EXPOSE 3000

# Command to run the app.
CMD ["serve", "-s", "build", "-l", "3000"]