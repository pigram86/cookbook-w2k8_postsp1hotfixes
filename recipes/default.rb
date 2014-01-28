#
# Cookbook Name:: w2k8_post_sp1_hotfixes
# Recipe:: default
#
# Copyright (C) 2013 Todd Pigram
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# make dir
batch node['w2k8hf']['make'] do
  code <<-EOH
  mkdir c:\\PostSP1
  EOH
  not_if {::File.exists?(node['w2k8hf']['sleep'])}
 not_if {reboot_pending?}
end

# download patches to server
# unzip patches to c:\
windows_zipfile node['w2k8hf']['zip'] do
  source node['w2k8hf']['url']
  action :unzip
  not_if {::File.exists?(node['w2k8hf']['sleep'])}
  not_if {reboot_pending?}
end

# Install patches
batch node['w2k8hf']['install'] do
  code <<-EOH
  c:\\postsp1\\installpostsp1.cmd
  EOH
  not_if {::File.exists?(node['w2k8hf']['log'])}
  not_if {reboot_pending?}
end

batch node['w2k8hf']['remove'] do
  code <<-EOH
  rmdir /s /q c:\\PostSp1
  EOH
  only_if {::File.exists?(node['w2k8hf']['log'])}
  not_if {reboot_pending?}
end

# if feature installs, schedule a reboot at end of chef run
windows_reboot 60 do
  reason 'cause chef said so'
  only_if {reboot_pending?}
end