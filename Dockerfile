FROM node:16 # Any need to update the version? 
WORKDIR ./
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
# Can use alpine. 
