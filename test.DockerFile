FROM microsoft/dotnet:2.2-sdk AS build-env

WORKDIR /App

#Download Java JDK
RUN apt-get update && apt-get install -y openjdk-8-jre

#install SonasScanner Tool
RUN dotnet tool install --global dotnet-sonarscanner --version 4.5.0

#COPY SonarQube Config
COPY SonarQube.Analysis.xml /root/.dotnet/tools/.store/dotnet-sonarscanner/4.5.0/dotnet-sonarscanner/4.5.0/tools/netcoreapp2.1/any/SonarQube.Analysis.xml
ENV PATH="${PATH}:/root/.dotnet/tools"

# restore nuget packages
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj
COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

#Build Execute Test And send to sonarwube
COPY . .
RUN chmod +x ./testscripts.sh

ENTRYPOINT ./testscripts.sh

