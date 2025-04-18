FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

ARG TARGETPLATFORM
ARG TARGETARCH
ARG BUILDPLATFORM

RUN echo "TARGETPLATFORM=${TARGETPLATFORM}" && \
    echo "TARGETARCH=${TARGETARCH}" && \
    echo "BUILDPLATFORM=${BUILDPLATFORM}"

WORKDIR /source

COPY . .

RUN dotnet restore -a $TARGETARCH

RUN dotnet publish -c release -o /app -a $TARGETARCH --self-contained false --no-restore

FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine

WORKDIR /app

COPY --from=build /app .

ENTRYPOINT ["dotnet", "Worker.dll"]