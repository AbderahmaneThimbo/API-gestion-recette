FROM node:18

WORKDIR /usr/index

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start", "npm test", "npm run lint", " npm run format"]
