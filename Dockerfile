FROM openjdk:11
ARG VERSION=0.4.0
WORKDIR /discord-music/
RUN wget https://github.com/jagrosh/MusicBot/releases/download/${VERSION}/JMusicBot-${VERSION}.jar &&\
    mv JMusicBot-${VERSION}.jar JMusicBot.jar
COPY config.txt /discord-music/
CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]
