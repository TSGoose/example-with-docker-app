# Setup

1.  ```bash
    git clone https://github.com/TSGoose/example-with-docker-app
    ```
2.  ```bash
    cd example-with-docker-app
    ```
3.  ```bash
    docker compose -f compose.dev.yaml up -d
    ```
4.  ```bash
    docker compose -f compose.dev.yaml exec workspace composer dev-setup
    ```
5.  ```bash
    docker compose -f compose.dev.yaml down
    docker compose -f compose.dev.yaml up -d
    ```
