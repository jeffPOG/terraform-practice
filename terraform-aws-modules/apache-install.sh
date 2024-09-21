#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html | sudo tee /var/www/html/index.html
sudo mkdir -p /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <head> <title>App1</title> </head> <body> <h1>Hello World from App1</h1> </body> </html>' > /var/www/html/app1/index.html | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/metadata.html