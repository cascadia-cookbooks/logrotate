#
# Cookbook Name:: cas_logrotate
# Recipe:: default
# Description:: Manages logrotate
#

# Manage 'logrotate' package
package 'logrotate' do
    action :upgrade
end

# Exit recipe if not logrotate entry attributes defined
unless node['cas_logrotate']['entries']
    return
end

# Configure logrotate entries
node['cas_logrotate']['entries'].each do |entry, data|
    template entry do
        path "/etc/logrotate.d/#{entry}"
        source 'logrotate.erb'
        owner 'root'
        group 'root'
        mode 0644
        action :create
        variables ({
            data: data
        })
    end
end
