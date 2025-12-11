class IcpCli < Formula
  desc "CLI tool for developing and deploying application on the Internet Computer Protocol (ICP)"
  homepage "https://github.com/dfinity/icp-cli"
  version "v0.1.0-beta.0"
  license "Apache-2.0"

  depends_on "icp-cli-network-launcher"

  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-aarch64-darwin.tar.gz"
      sha256 "dd6819d126c205d009de9ae2cc8a386810e7241af5bc000b687e5a357f535906"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/#{version}/icp-cli-#{version}-x86_64-darwin.tar.gz"
      sha256 "c4901c92a6faa423aa95acbd9c05ceaf2d51abbf3f47b527f4bd151398a30bb2"
    end
  end

  def install
    libexec.install "icp"
    icp_env = {
      ICP_CLI_NETWORK_LAUNCHER_PATH: "${ICP_CLI_NETWORK_LAUNCHER_PATH:-#{Formula["icp-cli-network-launcher"].opt_bin}}",
    }
    (bin/"icp").write_env_script libexec/"icp", icp_env
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
