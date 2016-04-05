# -*- mode: ruby -*-
# vi: set ft=ruby :

GLOBAL_RUBY = '2.3.0'
RUBIES = ['2.3.0', '2.2.3', '2.2.2']
GEMS = ['bundler', 'god']

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
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
    chef.add_recipe "recipe[ruby_build]"
    chef.add_recipe "recipe[ruby_rbenv::user]"
    chef.add_recipe "recipe[nodejs::nodejs_from_binary]"
    chef.add_recipe "recipe[nodejs::npm_from_source]"
    chef.add_recipe "recipe[nginx]"
    chef.add_recipe "recipe[esports-stack::ssh]"
    chef.add_recipe "recipe[esports-stack::packages]"
    chef.add_recipe "recipe[esports-stack::installs]"
    chef.add_recipe "recipe[god]"
    chef.add_recipe "recipe[esports-stack::services]"

    chef.json = {
      'nodejs' => {
        'version' => '5.1.0',
        'binary' => { 'checksum' => '305bf2983c65edea6dd2c9f3669b956251af03523d31cf0a0471504fd5920aac' }
      },
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
