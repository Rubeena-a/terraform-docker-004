# terraform-docker-004

###  Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision a local Docker container (Nginx).
It uses the Docker provider to pull an image and run it as a container automatically — no manual Docker commands needed.

### Provision and manage a Docker container using Terraform.

- Initialize Terraform with the Docker provider.

- Plan and apply infrastructure changes.

- Verify that the Nginx container runs successfully.

- Destroy infrastructure cleanly when done.

###  Tools Used

1. Terraform v1.0+

2. Docker Desktop / Docker Engine

3. Git & GitHub (for version control)


### Project Structure
```
├── .gitignore
├── README.md
├── main.tf
└── terraform.lock.hcl
```
### Execution Logs:
### 1. Initialize Terraform
Initialized provider
```
terraform init
```

Output:
```
Initializing the backend...
Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
- Installing kreuzwerker/docker v3.0.2...
Terraform has been successfully initialized!

```

### 2. Plan Infrastructure Changes
Planned 2 resources
```
terraform plan
```

Output:

```
Terraform used the selected providers to generate the following execution plan.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + name         = "nginx:latest"
      + keep_locally = false
    }

  # docker_container.nginx_container will be created
  + resource "docker_container" "nginx_container" {
      + id     = (known after apply)
      + name   = "nginx-server"
      + image  = (known after apply)
      + ports {
          internal = 80
          external = 8080
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```

### 3. Apply Infrastructure
Deployed Nginx container
```
terraform apply
```
Output:

```
docker_image.nginx: Creating...
docker_image.nginx: Creation complete after 1s [id=sha256:abcd123...]
docker_container.nginx_container: Creating...
docker_container.nginx_container: Creation complete after 2s [id=1234abcd...]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
### 4. Verify Docker Container
Verified running container
```
docker ps
```
Output:

```
CONTAINER ID   IMAGE          COMMAND                  PORTS                  NAMES
b7e8d2e6fa23   nginx:latest   "/docker-entrypoint.…"   0.0.0.0:8080->80/tcp   nginx-server
```

Running on http://localhost:8080

Output is: Nginx Welcome Page.

### 5. Check Terraform State
```
terraform state list
```
Output:

```
docker_image.nginx
docker_container.nginx_container
```

### 6. Destroy Infrastructure
Cleaned up successfully
When finished, destroy everything Terraform created:
```
terraform destroy
```
Output:

```

docker_container.nginx_container: Destroying... [id=1234abcd...]
docker_container.nginx_container: Destruction complete after 1s
docker_image.nginx: Destroying... [id=sha256:abcd123...]
docker_image.nginx: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
```

### Author
Rubeena Shaik
