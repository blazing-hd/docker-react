FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# only /app/build from previous build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
