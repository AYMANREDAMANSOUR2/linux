#!/bin/bash

# Apache Web Server Setup Script for CentOS By Ayman Reda 

echo "🔧 Updating system..."
sudo yum update -y

echo "📦 Installing Apache (httpd)..."
sudo yum install httpd -y

echo "🚀 Starting and enabling Apache..."
sudo systemctl start httpd
sudo systemctl enable httpd

echo "🧱 Configuring firewall..."
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

echo "🌐 Deploying example web page..."
echo "<h1>Welcome to Ayman's Web Server 🔥</h1>" | sudo tee /var/www/html/index.html

echo "✅ All done! Access your server via: http://$(hostname -I | awk '{print $1}')"

# Optional: Show Apache status
sudo systemctl status httpd

