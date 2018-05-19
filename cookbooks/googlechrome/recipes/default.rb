#
# Cookbook:: googlechrome
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_repository 'google-chrome' do
  uri 'http://dl.google.com/linux/chrome/deb/'
  distribution 'stable'
  components ['main']
  key 'https://dl.google.com/linux/linux_signing_key.pub'
end

apt_update

apt_package 'google-chrome-stable'
