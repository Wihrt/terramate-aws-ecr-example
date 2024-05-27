// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "ecr_repository" {
  create_lifecycle_policy       = false
  for_each                      = var.images
  repository_force_delete       = true
  repository_image_scan_on_push = false
  repository_name               = "${var.project}-${var.environment}/${each.key}"
  repository_type               = "private"
  source                        = "terraform-aws-modules/ecr/aws"
  version                       = "2.1.0"
}
resource "terraform_data" "ecr_image" {
  for_each = var.images
  triggers_replace = {
    source_image  = "${each.value.name}:${each.value.tag}"
    target_image  = module.ecr_repository[each.key].repository_url
    target_region = var.region
  }
  provisioner "local-exec" {
    command = "${path.module}/ecr-image.sh"
    environment = {
      ECR_IMAGE_COMMAND       = "copy"
      ECR_IMAGE_SOURCE_IMAGE  = "${each.value.name}:${each.value.tag}"
      ECR_IMAGE_TARGET_IMAGE  = module.ecr_repository[each.key].repository_url
      ECR_IMAGE_TARGET_REGION = var.region
    }
    interpreter = [
      "bash",
    ]
    when = create
  }
  provisioner "local-exec" {
    command = "${path.module}/ecr-image.sh"
    environment = {
      ECR_IMAGE_COMMAND       = "delete"
      ECR_IMAGE_SOURCE_IMAGE  = self.triggers_replace.source_image
      ECR_IMAGE_TARGET_IMAGE  = self.triggers_replace.target_image
      ECR_IMAGE_TARGET_REGION = self.triggers_replace.target_region
    }
    interpreter = [
      "bash",
    ]
    when = destroy
  }
}
