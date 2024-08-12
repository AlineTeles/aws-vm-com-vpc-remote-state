resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}
#esse bloco não cria as chaves, apenas sobe para a aws a chave pública
#logo, é necessário criar um par de chaves 
#neste caso, criei um par de chaves utilizando o terminal
#comando: ssh-keygen -f aws-key
#utilizando a função file(localdoarquivo), para ler as chaves

resource "aws_instance" "vm" {
  ami           = "ami-0862be96e41dcbf74" #ubunto
  instance_type = "t2.micro"
  #host_resource_group_arn = "arn:aws:resource-groups:us-west-2:012345678901:group/win-testhost"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.le-vpc.outputs.subnet_id #aqui estão lendo lidos os outputs
  vpc_security_group_ids      = [data.terraform_remote_state.le-vpc.outputs.security-group-id]
  associate_public_ip_address = true
  user_data                   = file("./docs/docker.sh")

  tags = {
    Name = "vm-terraform"
  }

}





