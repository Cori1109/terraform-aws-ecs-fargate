[
  {
    "name": "${name}",
    "image": "${image}",
    "essential": true,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "${region}",
        "awslogs-group": "/aws/ecs",
        "awslogs-stream-prefix": "${stream_prefix}"
      }
    }
  }
]
