package "git-core"
package "libpq-dev"
package "libmysqlclient-dev"
package "postgresql-client"
package "redis-server"
package "ruby-dev"

bash "install bower" do
  user "root"
  code "npm install bower"
end
