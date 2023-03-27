Vagrant.configure(2) do |config|
	common = <<-SHELL
	if ! grep -q bastion /etc/hosts; then  sudo echo "192.168.6.120     bastion" >> /etc/hosts ;fi
	if ! grep -q node1 /etc/hosts; then  sudo echo "192.168.6.121     node1" >> /etc/hosts ;fi
	if ! grep -q node2 /etc/hosts; then  sudo echo "192.168.6.122     node2" >> /etc/hosts ;fi
	if ! grep -q node3 /etc/hosts; then  sudo echo "192.168.6.123     node3" >> /etc/hosts ;fi
	if ! grep -q node4 /etc/hosts; then  sudo echo "192.168.6.124     node4" >> /etc/hosts ;fi
	if ! grep -q node5 /etc/hosts; then  sudo echo "192.168.6.125     node5" >> /etc/hosts ;fi
	#if ! id admin >  /dev/null 2>&1 ; then sudo useradd -G 10 -p $(openssl passwd -1 redhat) admin; fi
	#if [ ! -f /etc/sudoers.d/admin ] ; then sudo echo "admin        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/admin ; fi
	#sudo apt -y install vim tree net-tools telnet git python3-pip
	sudo apt update -y
	sudo apt install -y ansible python3-pip
	sudo echo "autocmd filetype yaml setlocal ai ts=2 sw=2 et" > /home/vagrant/.vimrc
	sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
	systemctl reset-failed sshd.service
	systemctl start sshd.service
	SHELL
	
	bastion = <<-SHELL
	sudo apt install -y sshpass
	pip3 install ansible
	export VAGRANT_DISABLE_VBOXSYMLINKCREATE=1
	export ANSIBLE_HOST_KEY_CHECKING=False
	git clone https://github.com/kubernetes-sigs/kubespray.git
  
	pip3 install -r kubespray/requirements.txt
	
	SHELL
  
  
  
  
	  config.vm.box = "bento/ubuntu-22.04"
	  config.vm.box_url = "bento/ubuntu-22.04"
  
	  config.vm.define "bastion" do |control|
		  control.vm.hostname = "bastion"
		  control.vm.network "private_network", ip: "192.168.6.120"
		  control.vm.provider "virtualbox" do |v|
			  v.customize [ "modifyvm", :id, "--cpus", "2" ]
			  v.customize [ "modifyvm", :id, "--memory", "2048" ]
			  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
			  v.customize ["modifyvm", :id, "--name", "bastion"]
		  end
		  config.vm.provision :shell, :inline => common
		  config.vm.provision :shell, :inline => bastion
	  end
	  config.vm.define "node1" do |node1|
		  node1.vm.hostname = "node1"
		  node1.vm.network "private_network", ip: "192.168.6.121"
		  node1.vm.provider "virtualbox" do |v|
			  v.customize [ "modifyvm", :id, "--cpus", "2" ]
			  v.customize [ "modifyvm", :id, "--memory", "2048" ]
			  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
			  v.customize ["modifyvm", :id, "--name", "node1"]
		  end
		  config.vm.provision :shell, :inline => common
	  end
	  config.vm.define "node2" do |node2|
		  node2.vm.hostname = "node2"
		  node2.vm.network "private_network", ip: "192.168.6.122"
		  node2.vm.provider "virtualbox" do |v|
			  v.customize [ "modifyvm", :id, "--cpus", "2" ]
			  v.customize [ "modifyvm", :id, "--memory", "2048" ]
			  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
			  v.customize ["modifyvm", :id, "--name", "node2"]
		  end
		  config.vm.provision :shell, :inline => common
	  end
	  config.vm.define "node3" do |node3|
		  node3.vm.hostname = "node3"
		  node3.vm.network "private_network", ip: "192.168.6.123"
		  node3.vm.provider "virtualbox" do |v|
			  v.customize [ "modifyvm", :id, "--cpus", "2" ]
			  v.customize [ "modifyvm", :id, "--memory", "2048" ]
			  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
			  v.customize ["modifyvm", :id, "--name", "node3"]
		  end
		  config.vm.provision :shell, :inline => common
	  end
	  config.vm.define "node4" do |node4|
		  node4.vm.hostname = "node4"
		  node4.vm.network "private_network", ip: "192.168.6.124"
		  node4.vm.provider "virtualbox" do |v|
			  v.customize [ "modifyvm", :id, "--cpus", "2" ]
			  v.customize [ "modifyvm", :id, "--memory", "2048" ]
			  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
			  v.customize ["modifyvm", :id, "--name", "node4"]
		  end
		  config.vm.provision :shell, :inline => common
	  end
	  config.vm.define "node5" do |node5|
		  node5.vm.hostname = "node5"
		  node5.vm.network "private_network", ip: "192.168.6.125"
		  node5.vm.provider "virtualbox" do |v|
			  v.customize [ "modifyvm", :id, "--cpus", "2" ]
			  v.customize [ "modifyvm", :id, "--memory", "2048" ]
			  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
					v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
			  v.customize ["modifyvm", :id, "--name", "node5"]
		  end
		  config.vm.provision :shell, :inline => common
	  end
  
  end