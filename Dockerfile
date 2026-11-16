FROM node:20-alpine

WORKDIR /app

# Upgrade npm to get cross-spawn 7.0.5 (fixes GHSA-3xgq-45jj-v275)
RUN npm install -g npm@10.9.2

COPY package*.json ./
RUN npm install --omit=dev

COPY . .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

CMD ["node", "server.js"]
