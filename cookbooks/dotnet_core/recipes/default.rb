#
# Cookbook:: dotnet_core
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


cookbook_file '/tmp/dotnet_core.sh' do
	source 'dotnet_core.sh'
end

execute 'dotnet' do
	command 'sh /tmp/dotnet_core.sh'
end
