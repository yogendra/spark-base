# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/centos66"
  # config.vm.box = "bento/centos-6.7"
  config.vm.hostname = "spark-base"
  config.vm.synced_folder ".", "/vagrant", type: "nfs", nfs_export: false

	config.vm.provider "vmware_fusion" do |v|
		v.vmx['memsize'] = 1024
		v.vmx['numvcpus'] = 1
		v.vmx['name'] = "spark-base"
	end
	config.ssh.insert_key = false
	config.vm.provision "shell", path: "provision/scripts/setup-centos.sh"
	config.vm.provision "shell", path: "provision/scripts/setup-centos-ssh.sh"
	config.vm.provision "shell", path: "provision/scripts/setup-java.sh"
	config.vm.provision "shell", path: "provision/scripts/setup-scala.sh"
	config.vm.provision "shell", path: "provision/scripts/setup-r.sh"
	config.vm.provision "shell", path: "provision/scripts/setup-hadoop.sh"
	config.vm.provision "shell", path: "provision/scripts/setup-spark.sh"
	config.vm.provision "shell", path: "provision/scripts/zerodisk.sh"

end
