FROM node:20-alpine

WORKDIR /src

COPY apps/express-api/package*.json ./

RUN npm install --omit=dev --verbose

COPY apps/express-api ./

RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

USER nodejs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "console.log('ok')" || exit 1

CMD ["node", "src/index.js"]