bash 'update apt' do
  user 'root'
  code "apt-get update"
end
