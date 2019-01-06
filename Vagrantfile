Vagrant.configure("2") do |config|
  numNodes = 3
  r = numNodes..1
  (r.first).downto(r.last).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.box = "ubuntu/trusty64"
      node.vm.provider "virtualbox" do |v|
        v.name = "node#{i}"
        v.customize ["modifyvm", :id, "--memory", "1024"]
      end

      if i < 10
        node.vm.network :private_network, ip: "192.168.10.12#{i}"
      else
        node.vm.network :private_network, ip: "192.168.10.1#{i}"
      end
      
      node.vm.hostname = "node#{i}"
      
      node.vm.provision "shell", path: "scripts/setup-ubuntu.sh"

    end
  end
end
