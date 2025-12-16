class IcpCli < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0-beta.1.tar.gz"
  sha256 "4db000d9d38d6ea14fd28f079f9e9aa15a27f0c0a55def66b1c651735dba9368"
  license "Apache-2.0"

  depends_on "rust" => :build
  depends_on "ic-wasm"
  depends_on "icp-cli-network-launcher"
  depends_on "openssl@3"

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
