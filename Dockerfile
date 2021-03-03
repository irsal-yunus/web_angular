# stage 1
FROM node:latest as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run ng build  --prod

# stage 2
FROM nginx:alpine
#COPY --from=node /app/dist/app /usr/share/nginx/html

COPY --from=builder /app/dist/app /var/www
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 4200

ENTRYPOINT ["nginx","-g","daemon off;"]


# stage 1
# FROM node
# WORKDIR /app
# RUN npm install -g @angular/cli@10.0.1
# COPY . /app
# # RUN npm install --production
# # COPY . .
# # RUN npm run build --prod
# CMD ng serve --host 0.0.0.0 --port 4200

# stage 2
# FROM node
# WORKDIR /app
# COPY package*.json ./
# RUN npm install --production

# COPY --from=node /app/dist ./dist

# COPY ormconfig.docker.json ./ormconfig.json

# CMD ng serve --host 0.0.0.0 --port 4200
