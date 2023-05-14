#!/bin/bash

# Cd into Sites Directory
cd ~/sites/

# Clone Repo
git clone https://github.com/jurdunnn/steam-price-checker.git 

# Copy populated .env into repo
cp ~/sites/.steam-price-checker-env ~/sites/steam-price-checker/.env

# Cd into repo
cd ~/sites/steam-price-checker/

# Composer Install
composer install

# npm Install
npm install

# Generate Encryption key
php artisan key:generate

# Migrate any new tables
php artisan migrate

# Run build
npm run build

# Cd into www
cd /var/www

# Remove old Site From /var/www
sudo rm -rf steam-price-checker

# Move repo to /var/www
sudo mv ~/sites/steam-price-checker ./

# Set Ownership
sudo chown -R www-data:www-data steam-price-checker 

# Set permissions
sudo chmod -R 775 steam-price-checker
