FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build 
WORKDIR /source 
EXPOSE 80
EXPOSE 443
COPY *.sln .
COPY ./AspNetCoreHero.Boilerplate.Api/*.csproj ./AspNetCoreHero.Boilerplate.Api/
COPY ./AspNetCoreHero.Boilerplate.Infrastructure/*.csproj ./AspNetCoreHero.Boilerplate.Infrastructure/
COPY ./AspNetCoreHero.Boilerplate.Application/*.csproj ./AspNetCoreHero.Boilerplate.Application/
COPY ./AspNetCoreHero.Boilerplate.Infrastructure.Shared/*.csproj ./AspNetCoreHero.Boilerplate.Infrastructure.Shared/
COPY ./AspNetCoreHero.Boilerplate.Domain/*.csproj ./AspNetCoreHero.Boilerplate.Domain/
COPY ./AspNetCoreHero.Boilerplate.Web/*.csproj ./AspNetCoreHero.Boilerplate.Web/



RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o out 


#FROM mcr.microsoft.com/dotnet/runtime:5.0
FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /app

COPY ./AspNetCoreHero.Boilerplate.Web/appsettings.json /app/AppSettings.json

COPY --from=build ./source/out/ .
ENTRYPOINT ["dotnet", "AspNetCoreHero.Boilerplate.Web.dll"]