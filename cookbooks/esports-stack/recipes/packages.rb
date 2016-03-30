package "git-core"
package "libpq-dev"
package "libmysqlclient-dev"
package "postgresql-client"
package "redis-server"
package "ruby-dev"

bash "install node and bower" do
  code "npm install -g bower phantomjs-prebuilt ember-cli"
end
