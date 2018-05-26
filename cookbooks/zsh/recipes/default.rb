#
# Cookbook:: zsh
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

zsh_users_from_data_bag = search('zsh_users')

raise ArgumentError, "You must provide what are your zsh users in data_bags/zsh_users!" if zsh_users_from_data_bag.length == 1

apt_package 'zsh'
apt_package 'git'

remote_file '/tmp/oh-my-zsh-install.sh' do
  source 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
  mode '0755'
end

zsh_users = zsh_users_from_data_bag.reject { |u| u.id == 'sample_user' }

zsh_users.each do |user|

  username = user.id

  execute "set zsh as default shell to #{username}" do
    command "sudo usermod -s /bin/zsh #{username}"
  end

  execute 'oh-my-zsh installation' do
    command "sudo -u #{username} bash -c /tmp/oh-my-zsh-install.sh"
  end

  cookbook_file "/home/#{username}/.zshrc" do
    source 'zshrc'
    owner username
    group username
  end

end
