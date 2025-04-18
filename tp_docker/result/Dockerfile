FROM node:18-slim

WORKDIR /usr/local/app

COPY . .

RUN npm install -g nodemon  \
    && npm ci \
    && npm cache clean --force \
    && mv /usr/local/app/node_modules /node_modules

ENV PORT=3000

ENV NODE_ENV=production

EXPOSE 3000

CMD ["node", "server.js"]