#
# Cookbook:: zsh
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'zsh::default' do
  context 'When all attributes are default, on Debian 9.4' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'debian', version: '9.4')
      runner.create_data_bag('zsh_users', {})
      runner.converge(described_recipe)
    end

    it 'installs zsh and git through apt' do
      expect(chef_run).to install_apt_package 'zsh'
      expect(chef_run).to install_apt_package 'git'
    end
  end
end
