class IcpCli < Formula
  desc "CLI tool for developing and deploying application on the Internet Computer Protocol (ICP)"
  homepage "https://github.com/dfinity/icp-cli"
  version "v0.1.0-beta.1"
  license "Apache-2.0"

  depends_on "icp-cli-network-launcher"

  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-aarch64-darwin.tar.gz"
      sha256 "fc7176bb3760c5c6292827c0a15657a02dfd3c91f98bfa8b05bedc2f5ec3b7da"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-x86_64-darwin.tar.gz"
      sha256 "44a8349a8405ec61ed5f6760ee75e9c077c7c732e75bcc24d7c23236aea6640e"
    end
  end

  def install
    libexec.install "icp"
    keg_launcher = Formula["icp-cli-network-launcher"].opt_bin/"icp-cli-network-launcher"
    icp_env = {
      ICP_CLI_NETWORK_LAUNCHER_PATH: "${ICP_CLI_NETWORK_LAUNCHER_PATH:-#{keg_launcher}}",
    }
    (bin/"icp").write_env_script libexec/"icp", icp_env
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
