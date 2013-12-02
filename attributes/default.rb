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
default[:w2k8hf][:make] = "make dir"
default[:w2k8hf][:remove] = "remove c:\\PostSp1" 
default[:w2k8hf][:url] = "http://pigramsoftware.no-ip.biz/repo/PostSP1.zip"
default[:w2k8hf][:install] = "install"
default[:w2k8hf][:log] = "C:/PostSp1_patches.log"
default[:w2k8hf][:sleep] = "C:/PostSp1/sleep.exe" 
default[:w2k8hf][:zip] = "c:/PostSP1"