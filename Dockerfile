
# Build with NODE
FROM node:latest as build
WORKDIR /app

COPY *.json ./
RUN npm install

COPY ./ ./
RUN npm run build

# Deploy on NGINX
FROM nginx:1.23.2

#COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
#RUN chown -R nginx:nginx /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
