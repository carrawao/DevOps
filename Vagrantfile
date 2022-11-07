Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/kinetic64"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.synced_folder "devops/", "/var/www/website"

  config.vm.provision "shell", inline: <<-SHELL
    apt update
    apt install -y python3
    apt install -y python3-pip
    pip install -U Flask
    python3 /var/www/website/app.py
  SHELL
end
