FROM node:18-alpine as dev

WORKDIR /nd_dbcntl/

COPY ./package*.json ./
RUN npm i

COPY ./prisma/schema.prisma ./prisma/
RUN npx prisma generate

COPY . ./
CMD npm start