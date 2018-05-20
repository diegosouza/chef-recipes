# # encoding: utf-8

# Inspec test for recipe googlechrome::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/usr/bin/google-chrome') do
  it { should exist }
end
