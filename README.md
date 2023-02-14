# Terraform AWS ECS on Fargate

## Introduction

This module sets up AWS ECS on Fargate

## Contents

- [Usage](#usage)

## Usage

```hcl
module "ecs_fargate" {
  source = "Cori1109/ecs-fargate/aws"

  security_groups = ["sg-xxxxxxxxxxxx"]
  subnets         = ["10.0.1.0/24", "10.0.2.0/24"]

``

