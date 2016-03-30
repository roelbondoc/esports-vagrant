template "#{node.nginx.dir}/sites-available/esports" do
  source "esports-site.erb"
  mode 0644
  owner node.nginx.user
  group node.nginx.user
end

nginx_site "esports"

#god_monitor 'esports-core/api' do
#  config 'esports-core-api.god.erb'
#end
