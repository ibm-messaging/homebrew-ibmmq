=begin
Copyright 2025 IBM Corp.

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

class Mqcontainerinspector < Formula

  desc "A collection of tools for interacting with IBM® MQ queue managers running in containers."

  version "v1.1.0"
  homepage "https://github.com/ibm-messaging/homebrew-ibmmq.git"
  url "https://github.com/ibm-messaging/mq-container-inspector/archive/refs/tags/#{version}.tar.gz"
  sha256 "1c22fb3e49cd512c2441e2c9810b8b65c00e74d70e3df458c076c3e3752ab8b2"
  license "Apache-2.0"
  head "https://github.com/ibm-messaging/mq-container-inspector.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[-s -w]

    system "go", "build", *std_go_args(output: bin/"mq-container-inspector", ldflags: ldflags), "."

  end

  def caveats
    <<~EOS
      The mq-container-inspector binary has been installed to:
        #{HOMEBREW_PREFIX}/bin/mq-container-inspector

      You can verify the installation by running:
        mq-container-inspector --help
    EOS
  end

  test do
    system "#{bin}/mq-container-inspector", "--help"
  end

end