#
# Cookbook:: dotnet_app
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


cookbook_file '/tmp/sample_app.sh' do
        source 'sample_app.sh'
end

execute 'dotnet' do
        command 'sh /tmp/sample_app.sh'
end
