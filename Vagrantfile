Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/kinetic64"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.synced_folder "devops/", "/var/www/website"

  config.vm.provision "shell", inline: <<-SHELL
    apt update
    apt install -y python3
    apt install -y python3-pip
    pip install -U Flask
    export FLASK_APP="/var/www/website/app.py"
    python3 -m flask run --host=0.0.0.0 
  SHELL
end
