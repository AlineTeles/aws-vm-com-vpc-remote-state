Este projeto cria uma máquina virtual na aws, utilizando o EC2.

É importante destacar que a vpc e o security group associados a essa vm já estavam previamente criados
e foram apenas adicionados aqui, utilizando os outputs do código deles (main.tf linhas 32 a 39)

O arquivo terraform.state desse código também foi configurado para ser salvo em uma bucket s3 que 
eu já tinha criado antes, então substitua no arquivo main.tf por uma outra, ou apenas apague
as linhas 12 a 16.

