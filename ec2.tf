resource "aws_key_pair" "my_key" {
    key_name = "${var.env}-key"
    public_key = file("static_key.pub")
}


resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [ aws_security_group.my_security_group.id ]
    associate_public_ip_address = true
    

    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("static_key")
      host = self.public_ip
      
    } 

    provisioner "file" {
      source = "../website"
      destination = "/tmp"
    }

    provisioner "remote-exec" {
      inline = [ 
        "sudo apt-get update",
        "sudo apt-get install nginx -y",
        "sudo cp /tmp/website/index.html /var/www/html/",
        "sudo cp /tmp/website/adnan.png /var/www/html/",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
       ]
      
    }

    root_block_device {
      volume_type = var.volume_type
      volume_size = var.volume_size
    }
    tags = {
      Name = "${var.env}-instance"
    }
}

