FROM openjdk:14-alpine

ENV VERSION 5.2 
ADD https://www.languagetool.org/download/LanguageTool-$VERSION.zip /LanguageTool-$VERSION.zip

RUN unzip LanguageTool-$VERSION.zip \
    && rm LanguageTool-$VERSION.zip

WORKDIR /LanguageTool-$VERSION

CMD java -Xmx400m -Xss512k -cp languagetool-server.jar org.languagetool.server.HTTPServer --port $PORT --public

USER nobody

EXPOSE $PORT

