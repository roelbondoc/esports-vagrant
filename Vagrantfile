# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.ssh.forward_agent = true

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network :private_network, ip: "10.1.2.99"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.omnibus.chef_version = :latest

  config.vm.provision "setup", type: "chef_solo" do |chef|
    chef.add_recipe "recipe[ruby_build]"
    chef.add_recipe "recipe[ruby_rbenv::user]"
    chef.add_recipe "recipe[nginx]"
    chef.add_recipe "recipe[esports-stack]"

    chef.json = {
      'rbenv' => {
        'user_installs' => [
          {
            'user' => 'vagrant',
            'rubies' => ['2.3.0', '2.2.3', '2.2.2'],
            'global' => '2.3.0',
            'gems' => {
              '2.3.0' => [
                {
                  'name' => 'bundler'
                }
              ],
              '2.2.3' => [
                {
                  'name' => 'bundler'
                }
              ],
              '2.2.2' => [
                {
                  'name' => 'bundler'
                }
              ]
            }
          }
        ]
      }
    }
  end
end
