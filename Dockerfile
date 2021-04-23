FROM openjdk:11-jre

ENV VERSION 5.3
ADD https://www.languagetool.org/download/LanguageTool-$VERSION.zip /LanguageTool-$VERSION.zip

RUN unzip LanguageTool-$VERSION.zip \
    && rm LanguageTool-$VERSION.zip

WORKDIR /LanguageTool-$VERSION

ADD languagetool.cfg ./languagetool.cfg

CMD java -Xmx256m -Xms128m -Xss512k -cp languagetool-server.jar org.languagetool.server.HTTPServer --port $PORT --public --config languagetool.cfg

USER nobody

EXPOSE $PORT

