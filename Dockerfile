FROM hugo00/dotnet-core-multi-target-docker:6.0-8.0

ENV DEBIAN_FRONTEND noninteractive
ENV LANG pt_BR.UTF-8

RUN apt-get update \
    && apt-get install -y --no-install-recommends locales \
    && apt-get install apt-utils gnupg ca-certificates -y \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt-get update \
    && apt-get install -y mono-complete \
    && wget https://dist.nuget.org/win-x86-commandline/v4.3.0/nuget.exe \
    && sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=pt_BR.UTF-8 \
    && rm -rf /var/lib/apt/lists/*
