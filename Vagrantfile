# -*- mode: ruby -*-
# vi: set ft=ruby :

GLOBAL_RUBY = '2.3.0'
RUBIES = ['2.3.1', '2.3.0', '2.2.3']
GEMS = ['bundler', 'god']

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_version = "=20160406.0.0"

  config.vm.network "forwarded_port", guest: 3000, host: 3000 # api
  config.vm.network "forwarded_port", guest: 3001, host: 3001 # cms
  config.vm.network "forwarded_port", guest: 3002, host: 3002 # connect
  config.vm.network "forwarded_port", guest: 3003, host: 3003 # myfeed
  config.vm.network "forwarded_port", guest: 3004, host: 3004 # nexus
  config.vm.network "forwarded_port", guest: 3005, host: 3005 # admin
  config.vm.network :private_network, ip: "10.1.2.99"
  config.vm.hostname = 'esports.dev'
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  config.timezone.value = "America/Toronto"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.aliases = %w(esports.dev)

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.omnibus.chef_version = :latest

  config.vm.provision "setup", type: "chef_solo" do |chef|
    chef.add_recipe "recipe[esports-stack::prerun]"
    chef.add_recipe "recipe[ruby_build]"
    chef.add_recipe "recipe[ruby_rbenv::user]"
    chef.add_recipe "recipe[nginx]"
    chef.add_recipe "recipe[nvm]"
    chef.add_recipe "recipe[esports-stack::ssh]"
    chef.add_recipe "recipe[esports-stack::packages]"
    chef.add_recipe "recipe[esports-stack::installs]"
    chef.add_recipe "recipe[esports-stack::services]"

    chef.json = {
      'rbenv' => {
        'user_installs' => [
          {
            'user' => 'vagrant',
            'rubies' => RUBIES,
            'global' => GLOBAL_RUBY,
            'gems' => {}.tap do |gems|
              RUBIES.each do |ruby|
                gems[ruby] = GEMS.map do |gem|
                  { 'name' => gem }
                end
              end
            end
          }
        ]
      }
    }
  end
end
