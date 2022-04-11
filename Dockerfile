FROM node:12.20-alpine AS  build
RUN apk update && apk upgrade &&  apk add bash && apk add --no-cache git
RUN git clone https://github.com/rishithrinad/helloworldangular.git
RUN  cd helloworldangular && npm install && npm install -g @angular/cli && ng build --prod
FROM nginx:1.17.1-alpine
COPY --from=build helloworldangular/dist/helloworldAngular /usr/share/nginx/html
EXPOSE 80
