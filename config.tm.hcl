globals {
  project     = "aws-ecr-example"
  environment = "test"

  # get the available regions with:
  #   aws ec2 describe-regions | jq -r '.Regions[].RegionName' | sort
  region = "eu-west-1"

  # images to copy into the aws account ecr registry as:
  #   ${project}-${environment}/${source_images.key}:${source_images.value.tag}
  source_images = {
    # see https://hub.docker.com/repository/docker/ruilopes/example-docker-buildx-go
    # see https://github.com/rgl/example-docker-buildx-go
    example = {
      name = "docker.io/ruilopes/example-docker-buildx-go"
      tag  = "v1.11.0"
    }
    # see https://github.com/rgl/hello-etcd/pkgs/container/hello-etcd
    # see https://github.com/rgl/hello-etcd
    hello-etcd = {
      name = "ghcr.io/rgl/hello-etcd"
      tag  = "0.0.1"
    }
  }
}

# see https://github.com/hashicorp/terraform
globals "terraform" {
  version = "1.7.4"
}

# see https://registry.terraform.io/providers/hashicorp/aws
# see https://github.com/hashicorp/terraform-provider-aws
globals "terraform" "providers" "aws" {
  version = "5.35.0"
}