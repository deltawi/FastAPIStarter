# FastAPI docker boilerplate

## Building Docker image 
```bash
docker build -t fastapi .
```

## Running Docker image
```bash
docker run -d --name fastapi_app -p 8071:80 fastapi
```

## Accessing the Application
With your FastAPI application running inside the Docker container, you can access the API documentation by navigating to the following URL in your web browser:

[localhost:8071/docs](localhost:8071/docs)

