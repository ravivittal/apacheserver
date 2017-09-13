#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'apache::server'

package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do 
  content "<h1>Hello World</h1>
  <h2>ipaddress: #{node['ipaddress']}</h2>
  <h2>hostname: #{node['hostname']}</h2>"
end

service 'httpd' do
  action [ :enable, :start ]
end

#include_recipe 'apache::server'
