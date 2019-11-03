FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# only /app/build from previous build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
