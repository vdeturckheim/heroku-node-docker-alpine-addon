FROM node:14.15.0-alpine

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN chown node:node /app
USER node



CMD ["node", "index.js"]
