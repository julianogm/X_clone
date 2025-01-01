FROM elixir:1.18.0-alpine

RUN apk add --no-cache \
  build-base \
  git \
#   nodejs \
#   npm \
  postgresql-client \
  inotify-tools

RUN mix local.hex --force && mix local.rebar --force

WORKDIR /app
COPY . .
RUN mix deps.get && mix deps.compile

# RUN npm install --prefix assets && npm run deploy --prefix assets
RUN mix phx.digest

EXPOSE 4000
CMD ["mix", "phx.server"]