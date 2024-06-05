# Docker 컨테이너가 실행 중인지 확인
if [[ $(docker ps --format '{{.Names}}' | grep nc-db-container) ]]; then
    # Docker 컨테이너가 실행 중이면 docker-compose down 실행
    echo "Stopping Docker containers..."
    cd "$(dirname "$0")"
    docker-compose down
    echo "Docker containers have been stopped."
else
    echo "No running Docker containers found."
fi
