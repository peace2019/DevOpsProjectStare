# Use Node.js Alpine base image
FROM node:alpine

# تثبيت الأدوات الأساسية مثل bash و curl وتثبيت TypeScript بشكل عالمي
RUN echo "http://dl-2.alpinelinux.org/alpine/v3.21/main" > /etc/apk/repositories \
    && apk update && apk add --no-cache bash curl && npm install -g typescript

# RUN apk update && apk add --no-cache bash curl && npm install -g typescript

# Create and set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json /app/

# Install dependencies
RUN npm install

# Copy the entire codebase to the working directory
COPY . /app/

# Expose the port your container app
EXPOSE 3000    

# Define the command to start your application (replace "start" with the actual command to start your app)
CMD ["npm", "start"]
