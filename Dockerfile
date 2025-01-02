FROM elixir:1.18.0-alpine

RUN apk add --no-cache \
  build-base \
  git \
  postgresql-client \
  inotify-tools \
  gcc \
  make \
  libc-dev
  #   nodejs \
  #   npm \

WORKDIR /app

COPY mix.exs mix.lock ./
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

COPY . .

# RUN npm install --prefix assets && npm run deploy --prefix assets
# RUN mix phx.digest

RUN mix deps.compile
EXPOSE 4000
CMD ["mix", "phx.server"]