# Build Stage
FROM microsoft/dotnet:2.2-sdk as build-env
WORKDIR /api
COPY *.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /publish

# Runtime Image Stage
FROM microsoft/dotnet:2.2-aspnetcore-runtime as Runtime
WORKDIR /app
COPY --from=build-env /publish /app
ENTRYPOINT [ "dotnet","api.dll"]
