# Stage 1: Build React app
FROM node:18 AS build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

COPY . .

# ✅ Add legacy OpenSSL flag to fix the error
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

