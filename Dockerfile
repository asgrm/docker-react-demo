#builder phase
FROM node:23-alpine AS builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
CMD npm run build

#run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
