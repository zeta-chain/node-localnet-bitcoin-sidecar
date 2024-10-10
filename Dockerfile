FROM node:20-alpine AS builder

WORKDIR /home/zeta/node

COPY js/* .

RUN npm install && npm install typescript -g && tsc

FROM node:20-alpine

COPY --from=builder /home/zeta/node/dist ./dist
COPY --from=builder /home/zeta/node/node_modules ./node_modules

CMD ["node", "dist/index.js"]