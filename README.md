# adopt_pummel

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

An example application built with dart_frog

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

# Commands
## Enable dart_frog
`dart pub global activate dart_frog_cli`
`export PATH="$PATH":"$HOME/.pub-cache/bin"`

## Run json_serializable
`dart run build_runner build`

## Run project with docker
- in build/
  - docker build -t adobt_pummel .
  - docker run -p 80:8080 -t adobt_pummel

## Build for DO
docker build build --tag registry.digitalocean.com/novas1r1/adopt_pummel
docker push registry.digitalocean.com/novas1r1/adopt_pummel

## Run server locally (localhost:8080/pets)
dart build/bin/server.dart

docker buildx build --platform linux --tag registry.digitalocean.com/novas1r1/adopt_pummel
docker buildx build --platform linux/amd64 --tag registry.digitalocean.com/novas1r1/adopt_pummel
--push \
-t registry.digitalocean.com/novas1r1/adopt_pummel

# Docs
https://dartfrog.vgv.dev/docs/overview

# Errors
Error: OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/sh":stat /bin/sh: no such file or directory: unknown

New-Item -ItemType Directory $env:ProgramFiles\doctl\ Move-Item -Path ~\doctl-1.79.0-windows-amd64\doctl.exe -Destination $env:ProgramFiles\doctl\ [Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path",[EnvironmentVariableTarget]::Machine) + ";$env:ProgramFiles\doctl\",[EnvironmentVariableTarget]::Machine) $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
