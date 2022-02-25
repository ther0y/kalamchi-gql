FROM hasura/graphql-engine:v2.2.0.cli-migrations-v3

ENV HASURA_GRAPHQL_MIGRATIONS_DIR="/hasura-migrations"
ENV HASURA_GRAPHQL_METADATA_DIR="/hasura-metadata"
COPY ./migrations "${HASURA_GRAPHQL_MIGRATIONS_DIR}"
COPY ./metadata "${HASURA_GRAPHQL_METADATA_DIR}"

ENV HASURA_GRAPHQL_METADATA_DATABASE_URL="$HASURA_GRAPHQL_METADATA_DATABASE_URL"
ENV HASURA_GRAPHQL_DATABASE_URL="$PG_DATABASE_URL"
ENV HASURA_GRAPHQL_ENABLED_LOG_TYPES="startup, http-log, webhook-log, websocket-log, query-log"
ENV HASURA_GRAPHQL_ADMIN_SECRET="$HASURA_ADMIN_SECRET"
WORKDIR /app
EXPOSE 8080
CMD ["graphql-engine", "serve"]
