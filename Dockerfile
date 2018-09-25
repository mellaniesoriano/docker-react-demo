# add a tag called "builder"
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

# add a second phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html