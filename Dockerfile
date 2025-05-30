FROM node:18-alpine

WORKDIR /app

# Step 1: copy package.json first
COPY package.json ./

# Step 2: install dependencies
RUN npm install --production

# Step 3: copy everything else
COPY . .

# Step 4: start your app (example)
CMD ["node", "index.js"]
