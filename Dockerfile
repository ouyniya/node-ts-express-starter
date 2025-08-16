# 1. ใช้ Node.js official image
# sha256:51dbfc749ec3018c7d4bf8b9ee65299ff9a908e38918ce163b0acfcd5dd931d9
FROM node:alpine

# 2. ตั้ง working directory
WORKDIR /app

# 3. copy package.json + package-lock.json
COPY package*.json ./

# 4. ติดตั้ง dependencies
RUN npm install

# 5. copy source code
COPY . .

# 6. build TypeScript
RUN npm run build

# 7. expose port
EXPOSE 3000

# 8. run app
CMD ["node", "dist/index.js"]