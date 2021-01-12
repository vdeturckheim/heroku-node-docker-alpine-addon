FROM node:14-alpine
RUN apk update && apk add ulimit
RUN ulimit -s

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
