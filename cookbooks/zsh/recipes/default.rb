#
# Cookbook:: zsh
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

zsh_users_from_data_bag = search('zsh_users')

raise ArgumentError, "You must provide what are your zsh users in data_bags/zsh_users!" if zsh_users_from_data_bag.length == 1

apt_package 'zsh'
apt_package 'unzip'

remote_file '/tmp/oh-my-zsh.zip' do
  source 'https://github.com/robbyrussell/oh-my-zsh/archive/master.zip'
  mode '0755'
end

execute 'oh-my-zsh.zip extraction to /tmp' do
  command 'unzip /tmp/oh-my-zsh.zip'
end

zsh_users = zsh_users_from_data_bag.reject { |u| u.id == 'sample_user' }

zsh_users.each do |user|

  execute "set zsh as default shell to #{user.id}" do
    command "chsh -s /bin/zsh #{user.id}"
  end

  cookbook_file "/home/#{user.id}/.zshrc" do
    source 'zshrc'
    owner user.id
    group user.id
  end

  execute "copy oh-my-zsh to user's home" do
    command "cp /tmp/oh-my-zsh-master /home/#{user.id}/.oh-my-zsh -rf"
  end

end
