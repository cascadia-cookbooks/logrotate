#
# Cookbook Name:: cas_logrotate
# Recipe:: default
# Description:: Manages logrotate
#

# Manage 'logrotate' package
package 'logrotate' do
    action :upgrade
end


