FROM node:20-alpine

WORKDIR /

COPY apps/bot/package*.json ./bot
RUN npm install --omit=dev --verbose

COPY apps/bot ./bot

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

USER nodejs

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "console.log('ok')" || exit 1

CMD ["node", "./bot/src/index.js"]


FROM node:20-alpine
WORKDIR /

COPY apps/node-api/package*.json ./api
RUN npm install --omit=dev --verbose

COPY apps/node-api ./api

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

USER nodejs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "console.log('ok')" || exit 1

CMD ["node", "./api/src/index.js"]