FROM brycemclachlan/base-ubuntu:latest AS base
FROM base
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates npm make g++
WORKDIR /
RUN git clone https://github.com/artf/grapesjs-preset-webpage.git
WORKDIR /grapesjs-preset-webpage
RUN npm i
RUN npm i grapesjs --no-save
RUN npm audit fix
ENTRYPOINT ["tini", "--"]
CMD ["sh", "-c", "npm start"]

## podman run -p 8080:8080 grapesjs-webpage
