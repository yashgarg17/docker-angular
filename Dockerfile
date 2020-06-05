FROM node:12.2.0

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

# COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=0 /app/dist/frontend /usr/share/nginx/html