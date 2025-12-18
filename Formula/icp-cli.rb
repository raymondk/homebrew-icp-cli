class IcpCli < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0-beta.2.tar.gz"
  sha256 "e3ee62316142805aa5254c61cfb6bbb8aa6579c746538db7792d777edd62b576"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/raymondk/homebrew-icp-cli/releases/download/icp-cli-0.1.0-beta.2"
    sha256 cellar: :any,                 arm64_sequoia: "d6d983f77c19fc01ced275c8e6d894ad8ab21a25ff68549691400c9fa7cb499d"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "c60c20d6a26326666c60f12c9396791a09002729480f8110094c606e850ee26d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7038cb7bfdfbb995c16f879c45f3f0830d23c4218731ef2166006e09749113f5"
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
