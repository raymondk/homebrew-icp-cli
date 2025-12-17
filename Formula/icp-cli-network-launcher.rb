class IcpCliNetworkLauncher < Formula
  desc "CLI interface to pocket-ic, used with icp-cli"
  homepage "https://github.com/dfinity/icp-cli-network-launcher"
  url "https://github.com/dfinity/icp-cli-network-launcher/archive/refs/tags/v11.0.0.tar.gz"
  sha256 "d4cf98ef6cd721533318124bc600a344e17391f764d3663f755b2539bb6035ba"
  license "Apache-2.0"
  revision 1

  bottle do
    root_url "https://github.com/raymondk/homebrew-icp-cli/releases/download/icp-cli-network-launcher-11.0.0_1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "37b02db9abd5c6123cb7b11687212a43cb47b936765284aba87df76a0dc50404"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d9ed66f91d89b82cedd78c342f1adcd1b5ef99da5bf25fddb23af46f7d01d891"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "db0a673d1eb0dced1b1fa9ff6209faae5aba11c76c284ce9973563866a85c403"
  end

  depends_on "jq" => :build
  depends_on "rust" => :build

  def install
    system "./package.sh", "out"
    bin.install "out/icp-cli-network-launcher"
    bin.install "out/pocket-ic"
  end
end
