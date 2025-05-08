FROM node:20-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "app.js" ]



# docker build -t my-node-app .
# docker start -p 3000:3000 my-node-app

# using git i will push this repo to github using git init , git add ., git remote add origin,

