FROM elixir:1.5 as build

ENV MIX_ENV prod
WORKDIR /opt/

RUN apt-get -yq update && \
    apt-get install -yq  --no-install-recommends \
        libpq-dev \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY mix.exs mix.lock /opt/

RUN mix local.hex --force && mix hex.info
RUN mix local.rebar --force
RUN mix deps.get --only prod

COPY . /opt/
RUN mix compile
RUN mix release --env=prod

FROM elixir:1.5 as run

WORKDIR /opt/

RUN apt-get -yq update && \
    apt-get install -yq  --no-install-recommends \
        libpq-dev \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /opt/_build/prod/rel/api /opt/

EXPOSE 4000
ENTRYPOINT [ "/opt/bin/api", "foreground" ]
