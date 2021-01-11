FROM node:14.15.0-alpine

WORKDIR /app
RUN chown node:node /app
USER node
COPY package.json .
USER root
RUN chown node:node /app/*
USER node
RUN npm install
COPY . .
USER root
RUN chown node:node /app/*
USER node




CMD ["node", "index.js"]
