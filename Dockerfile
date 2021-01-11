FROM node:14.15.0-alpine

WORKDIR /app
RUN chown node:node /app
USER node
COPY package.json .
RUN npm install
COPY . .

CMD ["node", "index.js"]
