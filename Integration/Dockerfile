FROM microsoft/dotnet:2.2-sdk
WORKDIR /integration

COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet build

ENTRYPOINT dotnet test --verbosity=normal


