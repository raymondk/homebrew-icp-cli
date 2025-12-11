class IcpCliNetworkLauncher < Formula
  desc "CLI interface to pocket-ic, used with icp-cli"
  homepage "https://github.com/dfinity/icp-cli-network-launcher"
  version "v11.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli-network-launcher/releases/download/#{version}/icp-cli-network-launcher-arm64-darwin-#{version}.tar.gz"
      sha256 "f13e60bb9593532b55816f3405d5c5b68966f30aa0dd8cad0e374437473b9b4f"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli-network-launcher/releases/download/#{version}/icp-cli-network-launcher-x86_64-darwin-#{version}.tar.gz"
      sha256 "6a981acf53b27fab5e2b6d6370b37c556b620cdf9557d81fab4c7df4556e2890"
    end
  end

  def install
    bin.install "icp-cli-network-launcher"
    bin.install "pocket-ic"
  end
end
