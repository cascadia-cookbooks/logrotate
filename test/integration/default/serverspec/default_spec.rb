require 'spec_helper'

describe 'cas_logrotate::default' do
    describe package('logrotate') do
        it { should be_installed }
    end

    describe file('/etc/logrotate.d/example') do
        it { should exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
        it { should be_mode '644' }
        its(:content) { should include '/var/log/example/*.log' }
        its(:content) { should include 'su root root' }
        its(:content) { should include 'daily' }
        its(:content) { should include 'notifempty' }
        its(:content) { should include 'size 1m' }
        its(:content) { should include 'rotate 10' }
        its(:content) { should include 'maxage 14' }
        its(:content) { should include 'create 0644 root root' }
        its(:content) { should include 'compress' }
        its(:content) { should include 'delaycompress' }
        its(:content) { should include 'dateext' }
        its(:content) { should include 'missingok' }
        its(:content) { should include 'echo "prerotate command"' }
        its(:content) { should include 'echo "postrotate command"' }
        its(:content) { should include 'sharedscripts' }
    end
end
