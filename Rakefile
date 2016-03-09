require 'sshkey'

task default: :setup

task :setup do
  puts 'Start setup'

  unless File.exists?('src')
    mkdir 'src'
  end

  unless File.exists?('ssh')
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

task :clean do
  puts 'Clean'
  rm_rf 'src'
  rm_rf 'ssh'
end
