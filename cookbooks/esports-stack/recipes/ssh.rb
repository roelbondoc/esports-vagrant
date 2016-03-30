execute "copy generated ssh key" do
  command <<-EOF
    cp /vagrant/config/ssh_config /home/vagrant/.ssh/config
    cp /vagrant/ssh/id_rsa /home/vagrant/.ssh/id_rsa
    cp /vagrant/ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
    chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
    chown vagrant:vagrant /home/vagrant/.ssh/id_rsa.pub
    chmod 600 /home/vagrant/.ssh/id_rsa
    chmod 644 /home/vagrant/.ssh/id_rsa.pub
  EOF
end
