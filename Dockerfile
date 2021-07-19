FROM alpine:3.14 AS build
RUN apk add alpine-sdk xz
RUN curl -O https://mednafen.github.io/releases/files/mednafen-server-0.5.2.tar.xz && tar -xf mednafen-server-0.5.2.tar.xz
WORKDIR /mednafen-server
RUN ./configure && make && make install

FROM alpine:3.14 AS prod
RUN apk add libstdc++
COPY --from=build /usr/local/bin/mednafen-server /usr/bin/mednafen-server
COPY ./config /etc/mednafen-server.conf
COPY ./run.sh .
ENTRYPOINT [ "/bin/sh", "/run.sh" ]