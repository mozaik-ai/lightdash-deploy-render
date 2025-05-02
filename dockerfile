FROM lightdash/lightdash:latest

ARG RENDER_EXTERNAL_URL

ENV SITE_URL $RENDER_EXTERNAL_URL

COPY ./entrypoint.sh /usr/bin/entrypoint.sh

RUN mkdir -p /app/public/maps && \
    curl -sSL https://cartomap.github.io/nl/wgs84/gemeente_2025.geojson -o /app/public/maps/gemeentes.geojson

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["pnpm", "-F", "backend", "start"]
