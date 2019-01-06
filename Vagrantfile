Vagrant.require_version '>= 1.9.0'
VAGRANTFILE_API_VERSION ||= "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  numNodes = 3
  r = numNodes..1
  (r.first).downto(r.last).each do |i|

    if i == 1
      nameNode = "haproxy"
    else
      nameNode = "node#{i-1}"
    end

    config.vm.define nameNode do |node|
      node.vm.box = "ubuntu/trusty64"
      node.vm.provider "virtualbox" do |v|
        v.name = nameNode
        v.customize ["modifyvm", :id, "--memory", "512"]
      end

      if i == 1
        node.vm.network :private_network, ip: "10.10.10.10"
        node.vm.hostname = "haproxy"
        node.vm.provision "shell", path: "scripts/setup-haproxy.sh"
      else
        node.vm.network :private_network, ip: "192.168.56.1#{i-1}"
        node.vm.hostname = "node#{i-1}"
        node.vm.provision "shell", path: "scripts/setup-server.sh"
      end

    end
  end
end
