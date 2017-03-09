FROM alpine

ENV PORT 80

RUN mkdir /app
ADD mif /app/mif
WORKDIR /app

EXPOSE $PORT

ENTRYPOINT /app/mif
