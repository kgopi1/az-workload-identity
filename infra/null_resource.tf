resource "null_resource" "azcli" {
  provisioner "local-exec" {
    command = "az group list -o table" 
  }
}