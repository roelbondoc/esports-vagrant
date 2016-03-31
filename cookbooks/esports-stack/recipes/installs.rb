link '/home/vagrant/src' do
  to '/vagrant/src'
  action :create
end

repos_to_clone = %w(
  esports-core
  thescore-connect2
  my_feed
  cms
  ansible-playbooks
)

repos_to_clone.each do |repo|
  execute "clone #{repo}" do
    cwd "/home/vagrant/src"
    user "vagrant"
    environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'}) 
    command "git clone git@github.com:scoremedia/#{repo}.git"
    not_if { File.exists?("/home/vagrant/src/#{repo}") }
  end
end

execute "copy config files" do
  command <<-EOF
    cp /vagrant/config/thescore-connect2-database.yml /home/vagrant/src/thescore-connect2/config/database.yml
    cp /vagrant/config/cms-database.yml /home/vagrant/src/cms/config/database.yml
  EOF
end

bundle_install_locations = %w(
  esports-core/api
  esports-core/nexus
  thescore-connect2
  my_feed
  cms
)

bundle_install_locations.each do |location|
  execute "bundle install #{location}" do
    cwd "/home/vagrant/src/#{location}"
    user "vagrant"
    environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
    command "/home/vagrant/.rbenv/shims/bundle install"
  end
end

execute "npm install espore-core/ember-admin" do
  cwd "/home/vagrant/src/esports-core/ember-admin"
  user "vagrant"
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  command "npm install"
end

execute "bower install espore-core/ember-admin" do
  cwd "/home/vagrant/src/esports-core/ember-admin"
  user "vagrant"
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  command "bower install"
end
