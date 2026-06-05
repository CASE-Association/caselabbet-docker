FROM node:lts AS build
WORKDIR /app
COPY site .
RUN npm i
RUN npm run build

FROM caddy:latest
COPY --from=build /app/dist /var/www
COPY Caddyfile /etc/caddy/Caddyfile
COPY site /var/www
EXPOSE 8000
