echo "Next Core DataBase Create Start"


echo "Checking if Docker is installed..."

# Docker 설치 여부 확인
if which docker &>/dev/null; then
    echo "Docker is installed."
else
    echo "Docker is not installed."

      sudo apt-get update
      sudo apt-get install -y docker.io

      # Docker 설치 확인
      if which docker &>/dev/null; then
          echo "Docker has been successfully installed."
      else
          echo "Failed to install Docker. Please check your internet connection or try again later."
      fi
fi

echo "Checking if Docker Compose is installed..."

# Docker Compose 설치 여부 확인
if which docker-compose &>/dev/null; then
    echo "Docker Compose is already installed."
else
    echo "Docker Compose is not installed. Installing Docker Compose..."

    # Docker Compose 설치
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # 설치 확인
    if which docker-compose &>/dev/null; then
        echo "Docker Compose has been successfully installed."
    else
        echo "Failed to install Docker Compose. Please check your internet connection or try again later."
    fi
fi

echo "docker running check"
# Docker가 이미 실행 중인지 확인
docker_running=$(docker info >/dev/null 2>&1 && echo "running" || echo "not running")

# Docker가 실행 중인지 확인
if [ "$docker_running" = "running" ]; then
    echo "Docker is already running."
else
    # Docker를 시작
    systemctl start docker
    echo "Docker has been started."
fi

docker-compose up -d

echo "Next Core DataBase Create End"

echo "next core Data base - docker - 접속 실행"

CONTAINER_ID=$(docker ps | grep "nc-db-container" | awk '{print $1}')
echo "$CONTAINER_ID"

if [ -z "$CONTAINER_ID" ]; then
  echo "Error: Docker container not found."
  exit 1
fi
#
## Docker 컨테이너에 접속합니다.
#docker exec -it "$CONTAINER_ID" mariadb -u nctest -pnctestpass! mydatabase
