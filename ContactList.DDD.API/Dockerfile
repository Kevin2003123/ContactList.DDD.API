#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["ContactList.DDD.API/ContactList.DDD.API.csproj", "ContactList.DDD.API/"]
COPY ["ContactList.DDD.Domain/ContactList.DDD.Domain.csproj", "ContactList.DDD.Domain/"]
COPY ["ContactList.DDD.Infrastructure/ContactList.DDD.Infrastructure.csproj", "ContactList.DDD.Infrastructure/"]
RUN dotnet restore "ContactList.DDD.API/ContactList.DDD.API.csproj"
COPY . .
WORKDIR "/src/ContactList.DDD.API"
RUN dotnet build "ContactList.DDD.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ContactList.DDD.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ContactList.DDD.API.dll"]