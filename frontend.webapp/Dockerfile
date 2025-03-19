FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
ARG BUILD_CONFIGURATION=RELEASE
WORKDIR /src

COPY WebDroneAi/WebDroneAi.csproj WebDroneAi/
RUN dotnet restore "WebDroneAi/WebDroneAi.csproj"

COPY . .
WORKDIR /src/WebDroneAi
RUN dotnet build "WebDroneAi.csproj" -c BUILD_CONFIGURATION -o /app/build

FROM build as publish
ARG BUILD_CONFIGURATION=RELEASE
RUN dotnet publish "WebDroneAi.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:7.0 as final
WORKDIR /app
EXPOSE 8080
EXPOSE 443
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet","WebDroneAi.dll"]

