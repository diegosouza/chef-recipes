#
# Cookbook:: aws
# Recipe:: shell
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute 'download pip installer script' do
  command "curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py"
end

execute 'execute pip installer script' do
  command "sudo python get-pip.py"
end

execute 'sudo pip install aws-shell' do
  command "sudo pip install aws-shell"
end
