FROM openjdk:8
ARG VERSION=0.3.8
WORKDIR /discord-music/
RUN wget https://github.com/jagrosh/MusicBot/releases/download/${VERSION}/JMusicBot-${VERSION}.jar &&\
    mv JMusicBot-${VERSION}.jar JMusicBot.jar
COPY config.txt /discord-music/
CMD ["java", "-Dnogui=true", "-jar", "JMusicBot.jar"]