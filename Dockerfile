FROM alpine:latest as build

WORKDIR /usr/src
ENTRYPOINT  /usr/src/elf

COPY elf.asm /usr/src/
RUN apk add --no-cache nasm && \
    nasm elf.asm -f bin -o elf && \
    chmod +x elf

FROM scratch as release

ENTRYPOINT ["/elf"]

COPY --from=build /usr/src/elf /elf

