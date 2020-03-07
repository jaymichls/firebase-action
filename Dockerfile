FROM node:10-slim

LABEL version="1.1.0"
LABEL repository="https://github.com/jaymichls/firebase-action"
LABEL homepage="https://github.com/jaymichls/firebase-action"
LABEL maintainer="Jason Michael"

LABEL com.github.actions.name="GitHub Action for Firebase with JDK"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

ENV JAVA_HOME="/opt/jdk"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

RUN apt-get update && apt-get install -y openjdk-8-jre
RUN npm install -g firebase-tools

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
