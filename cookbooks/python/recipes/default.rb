#
# Cookbook:: python
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'python'
#package 'nodejs'
service 'python' do
  action [:enable, :start]
end
