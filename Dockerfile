FROM node:21-alpine AS builder
# creating alias builder, everything under this "FROM" command belongs to the function builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html