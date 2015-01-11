# encoding: UTF-8
#
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
# Copyright:: Copyright (c) 2015 Onddo Labs, SL. (www.onddo.com)
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'

describe file('/home/bob/.ssh') do
  it { should be_directory }
  it { should be_owned_by 'bob' }
  it { should be_grouped_into 'bob' }
  it { should be_mode 700 }
end

content = [
  '# Generated by Chef',
  'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCctNyRouVDhzjiP+u3R2+C0nD4VgsRgN9rOiz'\
  'D2ePBrf8508VR5envsmEY5oF+TM3k/wb2xBY45KXOu9yQjQi9RcCYvrCAu3wPTrx07vRetkDIvs'\
  '/O383zQQanrHMGckNzh83uwDU4JcJqBP2EwkTMUqlk6xyrGuQyjmWFKWjjUUkmHFII5azAh+9bp'\
  '4OjULE9h9fy4Y3ZOxHMrHuC5AjkWhvy88ItmGBf0sj0iW0893UVrzdfB20dz+G9pM2lE5NK/b/z'\
  'fF7UlIjgI9oR9w2+YaNZE/fmuHpH94Gx/Ptlwxb2tmdEReA8DPsnHMIML3ltcpJrwgVdTJEAAz1'\
  'JnARx bob@acme.com',
  'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCySLKbpFRGCrKU/N6jNVB8vZLzexKbkq2bXPR'\
  'KUakmf8qrSQI9Bl1C8+6//uKpe909DrZzEkJzPC9BgpNnWtJ25SxHogKb1SybAk0OFc61X7wl1k'\
  'noo+OcuW6Moi0vpNiUGy2VnM0nyecLoQxggvnj1392uoMdS4VY71PGdcBac7p9IwAwYxlsuFEKR'\
  'cfKisJAHDEblgSFyC9lLMMjTSxxKn8s5AaR1h+Lb3Kwibd7ikvIgYRybTbD12FtQRxuWZBVm39C'\
  'M3539gT6514IaYyYVDyIEFDyGjK2UV27ah56jMaRFGX4IIh2gH5P2XaV7As5p8RPYoWwf+pCz19'\
  'mrPd/ bob@home.com comment'
].join("\n") << "\n"

describe file('/home/bob/.ssh/authorized_keys') do
  it { should be_file }
  it { should be_owned_by 'bob' }
  it { should be_grouped_into 'bob' }
  it { should be_mode 600 }
  its(:content) { should eq content }
end
