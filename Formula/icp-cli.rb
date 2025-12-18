class IcpCli < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0-beta.2.tar.gz"
  sha256 "e3ee62316142805aa5254c61cfb6bbb8aa6579c746538db7792d777edd62b576"
  license "Apache-2.0"
  revision 1

  bottle do
    root_url "https://github.com/raymondk/homebrew-icp-cli/releases/download/icp-cli-0.1.0-beta.1_1"
    sha256 cellar: :any,                 arm64_sequoia: "54d88d1264a4940c654275d5bf5b23d4b701b7ae24bfc080d33bb8ec2def17e7"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "ae4d7dc1a71d10fb470876e1c2fb6a13dd9e2b5165946bf3de32b281a3651f53"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5f93db72bb19bdb84612285b43f14b57faeec8ab1f0dccec08a751a345d340e7"
  end

  depends_on "rust" => :build
  depends_on "ic-wasm"
  depends_on "icp-cli-network-launcher"
  depends_on "openssl@3"
  depends_on "zlib"

  def install
    system "cargo", "install", *std_cargo_args(root: libexec, path: "crates/icp-cli")

    keg_launcher = Formula["icp-cli-network-launcher"].opt_bin/"icp-cli-network-launcher"
    icp_env = {
      ICP_CLI_NETWORK_LAUNCHER_PATH: "${ICP_CLI_NETWORK_LAUNCHER_PATH:-#{keg_launcher}}",
    }
    (bin/"icp").write_env_script libexec/"bin/icp", icp_env
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
