resource "docker_image" "custom_app" {
  name = "my_custom_app"
  build {
    context="${path.module}"
    dockerfile="Dockerfile"
  }
}

resource "docker_container" "custom_app_container" {
  name  = "custom_app_container"
  image = docker_image.custom_app.name
  ports {
    internal = 80
    external = 8081
  }
}