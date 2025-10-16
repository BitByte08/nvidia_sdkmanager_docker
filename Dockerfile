# Ubuntu 22.04 기반
FROM ubuntu:22.04

# 비대화식 모드 (tzdata 등 설치 시 대기 방지)
ENV DEBIAN_FRONTEND=noninteractive

# 기본 패키지 설치
RUN apt update && apt install -y wget dpkg
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
RUN dpkg -i cuda-keyring_1.1-1_all.deb
RUN apt update && apt install -y sdkmanager
RUN mkdir /home/user

# 유저 설정
RUN groupadd -g 999 user
RUN useradd -r -u 999 -g user user
RUN chown -R user:user /home/user
USER user





# 기본 쉘
CMD ["/bin/bash"]
