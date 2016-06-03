require 'sshkey'

task default: :setup

task :setup do
  unless File.exists?('src')
    mkdir 'src'
  end

  if File.exists?('ssh')
    ssh_public_key = File.read('ssh/id_rsa.pub')
    puts ssh_public_key
    puts "Please add the above ssh public key to your github account."
    puts "Press ENTER to continue."
    STDIN.gets.chomp
  else
    mkdir 'ssh'
    k = SSHKey.generate
    File.write('ssh/id_rsa', k.private_key)
    File.write('ssh/id_rsa.pub', k.ssh_public_key)

    puts k.ssh_public_key
    puts "Please add the above ssh public key to your github account."
    puts "Press ENTER to continue."
    STDIN.gets.chomp
  end
end
