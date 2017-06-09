#
# Cookbook:: dotnet_core
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

application_name = "#{node['application']['name']}.zip"

cookbook_file '/tmp/dotnet_core.sh' do
	source 'dotnet_core.sh'
end

execute 'dotnet_core_installation' do
	command 'sh /tmp/dotnet_core.sh'
end

directory '/tmp/ApplicationDownloadDirectory' do
        owner 'root'
        group 'root'
        mode  '0755'
        action :create
end

directory '/tmp/ApplicationDirectory' do
        owner 'root'
        group 'root'
        mode  '0755'
        action :create
end

remote_file "/tmp/ApplicationDownloadDirectory/#{application_name}" do
        source node['application']['url']
        action :create_if_missing
end

execute 'unzip application' do
        command "unzip /tmp/ApplicationDownloadDirectory/#{application_name} -d /tmp/ApplicationDirectory"
end

#execute 'change' do
#        command "cd /tmp/ApplicationDirectory/#{application_name}/"
#       command 'dotnet Tavisca.ProcessAutomation.Web.dll --server.urls http://*:5001 --environment "Production"'
#end

