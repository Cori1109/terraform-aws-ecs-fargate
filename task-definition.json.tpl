[
  {
    "name": "${name}",
    "image": "${image}",
    "cpu": ${ecs_cpu},
    "memory": ${ecs_memory},
    "essential": true,
    "portMappings": [
      {
        "hostPort": ${container_port},
        "containerPort": ${container_port}
      }
    ],
    "environment": [${env_vars}],
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
