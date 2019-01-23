dotnet test ./tests/tests.csproj /p:CollectCoverage=true /p:CoverletOutputFormat=\"opencover,teamcity,cobertura\" /p:CoverletOutput="../coveragrereports/" 
dotnet sonarscanner begin /k:"NetCore-Sample" /d:sonar.cs.opencover.reportsPaths="./coveragrereports/coverage.opencover.xml"
dotnet build
dotnet sonarscanner end
