#! /bin/bash

sudo yum update -y # updates the server
sudo yum install -y httpd # install the apache web service
sudo systemctl start httpd # starts the apache web service
sudo systemctl enable httpd # start apache web service at boot
sudo echo '<h1>Welcome to Nextgen</h1>' | sudo tee /var/www/html/index.html # create front web page
sudo mkdir /var/www/html/app1 # create directory for second web page
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254//latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html