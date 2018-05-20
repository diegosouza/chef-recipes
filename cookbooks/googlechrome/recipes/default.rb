#
# Cookbook:: googlechrome
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']

when 'debian'
  apt_repository 'google-chrome' do
    uri 'http://dl.google.com/linux/chrome/deb/'
    distribution 'stable'
    components ['main']
    key 'https://dl.google.com/linux/linux_signing_key.pub'
  end

  apt_update
  apt_package 'google-chrome-stable'

when 'rhel'
  yum_repository 'google-chrome' do
    baseurl 'http://dl.google.com/linux/chrome/rpm/stable/x86_64'
    gpgkey 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
    action [:create, :makecache]
  end

  yum_package 'google-chrome-stable'

else
  puts 'Plataforma não suportada!'
end
