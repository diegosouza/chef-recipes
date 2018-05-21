# # encoding: utf-8

# Inspec test for recipe zsh::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/bin/zsh') do
  it { should exist }
end


