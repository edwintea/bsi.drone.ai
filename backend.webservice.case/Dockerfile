FROM mcr.microsoft.com/dotnet/sdk:8.0 as build
ARG BUILD_CONFIGURATION=RELEASE
WORKDIR /src

COPY ApiVisionCaseList.Presentation/ApiVisionCaseList.Presentation.csproj ApiVisionCaseList.Presentation/
RUN dotnet restore "ApiVisionCaseList.Presentation/ApiVisionCaseList.Presentation.csproj"

COPY . . 
WORKDIR /src/ApiVisionCaseList.Presentation
RUN dotnet build "ApiVisionCaseList.Presentation.csproj" -c BUILD_CONFIGURATION -o /app/build

FROM build as publish
ARG BUILD_CONFIGURATION=RELEASE
RUN dotnet publish "ApiVisionCaseList.Presentation.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 as final
WORKDIR /app
EXPOSE 5272 8080 443
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet","ApiVisionCaseList.Presentation.dll"]