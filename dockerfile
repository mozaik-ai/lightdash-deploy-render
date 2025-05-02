FROM lightdash/lightdash:latest

ARG RENDER_EXTERNAL_URL

ENV SITE_URL $RENDER_EXTERNAL_URL

RUN apt-get update && apt-get install -y curl

RUN mkdir -p /usr/app/packages/frontend/public/maps && \
    curl -sSL https://cartomap.github.io/nl/wgs84/gemeente_2025.geojson -o /usr/app/packages/frontend/public/maps/gemeentes.geojson

COPY ./entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["pnpm", "-F", "backend", "start"]
