FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

RUN mkdir -p /opt/dn-init/sql /opt/dn-init/scripts
COPY sql/ /opt/dn-init/sql/
COPY scripts/entrypoint.sh scripts/init-db.sh /opt/dn-init/scripts/

RUN sed -i 's/\r$//' /opt/dn-init/scripts/*.sh \
    && chmod 0755 /opt/dn-init/scripts/entrypoint.sh /opt/dn-init/scripts/init-db.sh \
    && chown -R mssql:mssql /opt/dn-init

USER mssql

EXPOSE 1433

ENTRYPOINT ["/opt/dn-init/scripts/entrypoint.sh"]
CMD ["/opt/mssql/bin/sqlservr"]
