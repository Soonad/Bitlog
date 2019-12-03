# ---------------------------------------------------------
# Build Release
# ---------------------------------------------------------
FROM elixir:1.9.4-alpine as build

ENV MIX_ENV=prod

RUN mix local.hex --force && \
    mix local.rebar --force

RUN apk add -U --no-cache git

RUN mkdir -p /app
WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
RUN mix deps.compile

COPY config ./config
COPY lib ./lib
COPY priv ./priv

RUN mix phx.digest
RUN mix release

# ---------------------------------------------------------
# Run Release
# ---------------------------------------------------------
FROM alpine:3
LABEL maintainer="Bernardo Amorim"

RUN apk add -U --no-cache bash openssl

# Setup elixir app release
COPY --from=build /app/_build/prod/rel/bitlog /app/.
ENV PORT=3000
EXPOSE 3000

CMD /app/bin/bitlog start