required_plugins = %w( vagrant-hostsupdater vagrant-berkshelf )
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.define "python" do |python|
    python.vm.box = "ubuntu/xenial64"
    python.vm.network "private_network", ip: "192.168.10.100"
    python.hostsupdater.aliases = ["development.local"]
    python.vm.synced_folder "~/Engineering3637/InfrastructureAsCode/Uber_Project/app", "/home/ubuntu/app"
    python.vm.provision "chef_solo" do | chef |
      chef.arguments = "--chef-license accept"
      chef.add_recipe "python::default"
    end
  end

  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "ubuntu/xenial64"
    nginx.vm.network "private_network", ip: "192.168.10.100"
    #app.hostsupdater.aliases = ["development.local"]
    nginx.vm.provision "chef_solo" do | chef |
      chef.arguments = "--chef-license accept"
      chef.add_recipe "nginx::default"
    end
  end
end
