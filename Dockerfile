# stage 1
FROM node
WORKDIR /app
RUN npm install -g @angular/cli@10.0.1
COPY . /app
# RUN npm install --production
# COPY . .
# RUN npm run build --prod
CMD ng serve --host 0.0.0.0 --port 4200

# stage 2
# FROM node
# WORKDIR /app
# COPY package*.json ./
# RUN npm install --production

# COPY --from=node /app/dist ./dist

# COPY ormconfig.docker.json ./ormconfig.json

# CMD ng serve --host 0.0.0.0 --port 4200
