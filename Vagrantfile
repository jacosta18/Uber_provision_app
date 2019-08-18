required_plugins = %w( vagrant-hostsupdater vagrant-berkshelf )
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.define "python" do |python|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder "python", "/home/ubuntu/python"
    app.vm.provision "shell", inline: "echo DB_HOST=192.168.10.150 >> .bashrc"
    app.vm.provision "chef_zero" do | chef |
      chef.python_path = "~/Engineering3637/InfrastructureAsCode/Uber_Project/Python_cookbook/python"
      chef.arguments = "--chef-license accept"
      chef.add_recipe "python::default"
    end
  end

  config.vm.define "nginx" do |nginx|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["development.local"]
    app.vm.synced_folder "nginx", "/home/ubuntu/nginx"
    app.vm.provision "shell", inline: "echo DB_HOST=192.168.10.150 >> .bashrc"
    app.vm.provision "chef_zero" do | chef |
      chef.nodes_path = "~/Engineering3637/InfrastructureAsCode/Uber_Project/Nginx_cookbook/nginx"
      chef.arguments = "--chef-license accept"
      chef.add_recipe "nginx::default"
    end
  end
end
