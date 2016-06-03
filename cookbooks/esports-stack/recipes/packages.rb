package "git-core"
package "libpq-dev"
package "libmysqlclient-dev"
package "postgresql-client"
package "redis-server"
package "ruby-dev"
package "python"
package "python-dev"
package "python-pip"
package "imagemagick"
package "mitmproxy"
package "cmake"
package "pkg-config"

nvm_install 'v5.1.0'  do
  from_source false
  alias_as_default true
  action :create
end

bash 'add node_module bin to path' do
  user 'vagrant'
  code "echo 'export PATH=/home/vagrant/src/esports-core/ember-admin/node_modules/.bin:$PATH' >> /home/vagrant/.bashrc"
end

bash 'update pip' do
  code 'pip install -U pip'
end

bash 'install virtualenv' do
  code 'pip install virtualenv'
end
