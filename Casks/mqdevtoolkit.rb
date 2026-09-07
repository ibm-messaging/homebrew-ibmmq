=begin
Copyright 2024, 2026 IBM Corp.

Licensed under the Apache License, Version 2.0 (the 'License');
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=end


cask "mqdevtoolkit" do
  version "10.0.0.0"
  sha256 "1e8e35dbb00f7ac61d7f7f76561de11d737b61d22627ea964ccf4195f3c7fa6a"

  url "https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/messaging/mqdev/mactoolkit/#{version}-IBM-MQ-DevToolkit-MacOS.pkg"
  name "mqdevtoolkit"
  desc "IBM MQ Advanced Toolkit for MacOS"
  homepage "https://github.ibm.com/ibm-messaging/homebrew-ibmmq"

  depends_on arch: :arm64

  pkg "#{version}-IBM-MQ-DevToolkit-MacOS.pkg"

  uninstall pkgutil: "com.ibm.cloud.mqclient"

  caveats do
    license "https://ibm.biz/mqdevmacclient"
    path_environment_variable "/opt/mqm/bin"

    bold      = ->(s) { "\e[1m#{s}\e[22m" }
    underline = ->(s) { "\e[4m#{s}\e[24m" }
    italic    = ->(s) { "\e[3m#{s}\e[23m" }

    <<~EOS
    
      Full license information is in /opt/mqm/licenses/
      #{underline.call(bold.call("PLEASE READ"))}
      If you don't accept these license terms, uninstall by running:
        #{italic.call("brew uninstall ibm-messaging/ibmmq/mqdevtoolkit")}

      #{bold.call("Post Install")}
        Add /opt/mqm/bin and /opt/mqm/samp/bin to PATH by editing /etc/paths.
        Set the dynamic library path:
          #{italic.call("export DYLD_LIBRARY_PATH=/opt/mqm/lib64")}
    EOS
  end

  uninstall_preflight_steps do
    remove "/opt/mqm/gskit9/lib"
  end

end
