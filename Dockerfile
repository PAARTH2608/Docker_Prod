FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .

RUN npm install
COPY . .
RUN npm run build

# /app/build <-- all the stuff for outer world

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# start nginx is a default command of nginx