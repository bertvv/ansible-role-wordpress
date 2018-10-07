# vi: ft=ruby

VAGRANTFILE_API_VERSION = '2'
ROLE_NAME = 'wordpress'

hosts = [
  { maintainer: 'bento', distro: 'centos-7.5', ip: '192.168.56.4' },
  { maintainer: 'bento', distro: 'fedora-28',  ip: '192.168.56.5' }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'db' do |node|
    node.vm.box = 'bento/centos-7.5'
    node.vm.hostname = 'db'
    node.vm.network :private_network, ip: '192.168.56.99'
  end

  hosts.each do |host|
    host_name = host[:distro] + '-' + ROLE_NAME

    config.vm.define host_name do |node|
      node.vm.box = host[:maintainer] + '/' + host[:distro]
      node.vm.hostname = host_name
      node.vm.network :private_network, ip: host[:ip]
      node.vm.provision 'ansible' do |ansible|
        ansible.compatibility_mode = '2.0'
        if host[:distro].start_with? 'fedora-28'
          ansible.extra_vars = {
            ansible_python_interpreter: '/usr/bin/python3'
          }
        end
        ansible.playbook = 'test.yml'
      end
    end
  end

end
