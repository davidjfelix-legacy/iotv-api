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
# FIXME: make this work
# RUN mix release --env=prod

FROM elixir:1.5 as run

ENV MIX_ENV prod
ENV PORT 4000
WORKDIR /opt/

RUN apt-get -yq update && \
    apt-get install -yq  --no-install-recommends \
        libpq-dev \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# FIXME: remove this line
RUN mix local.hex --force && mix hex.info

COPY --from=build /opt/ /opt/

EXPOSE 4000

# FIXME: make this work
# ENTRYPOINT [ "/opt/bin/api", "foreground" ]
# FIXME: remove this line
ENTRYPOINT [ "./start.sh" ]
