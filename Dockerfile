# ---------------------------------------------
# 1️⃣ Build stage – compile the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Copy only the project file first, restore, then copy the rest
COPY AetherOS/*.csproj ./AetherOS/
RUN dotnet restore AetherOS/AetherOS.csproj

# Copy the full source and publish
COPY . .
RUN dotnet publish AetherOS/AetherOS.csproj -c Release -o /app/publish

# ---------------------------------------------
# 2️⃣ Runtime stage – the lightweight runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# The published DLL is named after the project: AetherOS.dll
ENTRYPOINT ["dotnet", "AetherOS.dll"]
