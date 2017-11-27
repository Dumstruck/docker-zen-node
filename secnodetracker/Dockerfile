FROM node:9-alpine

# set our node environment, either development or production
# defaults to production, compose overrides this to development on build and run
ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

RUN apk update
RUN apk add tini su-exec

EXPOSE 19033 9033

WORKDIR /home/node/secnodetracker


COPY src .

RUN npm install

COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

CMD ["node", "app.js"]

ENTRYPOINT ["tini", "-v", "--", "/home/node/secnodetracker/entrypoint.sh"]
