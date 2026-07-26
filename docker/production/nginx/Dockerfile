
FROM node:16-alpine AS builder

WORKDIR /var/www

COPY package*.json ./

RUN npm install --legacy-peer-deps \
    && npm install webpack@5.76.0 webpack-cli@4.10.0 --save-dev
COPY . .

RUN npm run production


FROM nginx:alpine

COPY ./docker/production/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /var/www/public /var/www/public

WORKDIR /var/www/public

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]