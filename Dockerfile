FROM hasura/graphql-engine:v2.2.0

ENV HASURA_GRAPHQL_MIGRATIONS_DIR="/hasura-migrations"
ENV HASURA_GRAPHQL_METADATA_DIR="/hasura-metadata"
COPY ./migrations "${HASURA_GRAPHQL_MIGRATIONS_DIR}"
COPY ./metadata "${HASURA_GRAPHQL_METADATA_DIR}"
COPY config.yaml .

ENV HASURA_GRAPHQL_JWT_SECRET="$HASURA_GRAPHQL_JWT_SECRET"
ENV HASURA_GRAPHQL_METADATA_DATABASE_URL="$HASURA_GRAPHQL_DATABASE_URL"
ENV HASURA_GRAPHQL_DATABASE_URL="$HASURA_GRAPHQL_DATABASE_URL"
ENV PG_DATABASE_URL="$HASURA_GRAPHQL_DATABASE_URL"
ENV HASURA_GRAPHQL_ENABLED_LOG_TYPES="startup, http-log, webhook-log, websocket-log, query-log"
ENV HASURA_GRAPHQL_ADMIN_SECRET="$HASURA_GRAPHQL_ADMIN_SECRET"
ENV ACTION_BASE_URL="$ACTION_BASE_URL"
ENV ACTION_SECRET_ENV="$ACTION_SECRET_ENV"
ENV HASURA_GRAPHQL_JWT_SECRET="${HASURA_GRAPHQL_JWT_SECRET}"

EXPOSE 8080

CMD graphql-engine \
    --database-url $HASURA_GRAPHQL_DATABASE_URL \
    serve