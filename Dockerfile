FROM node:13-alpine

ADD . /src
WORKDIR /src
RUN apk add --no-cache ca-certificates bash curl patch && npm install --unsafe-perm

COPY --from=gcr.io/berglas/berglas:latest /bin/berglas /bin/berglas

ENTRYPOINT ["/bin/berglas", "exec", "--"]
CMD ["npm", "run", "start"]
