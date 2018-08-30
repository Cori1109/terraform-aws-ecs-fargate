[
  {
    "name": "${name}",
    "image": "${image}",
    "essential": true,
    "portMappings": [
      {
        "hostPort": ${container_port},
        "containerPort": ${container_port}
      }
    ],
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
