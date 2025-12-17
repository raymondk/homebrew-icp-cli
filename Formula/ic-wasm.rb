class IcWasm < Formula
  desc "CLI tool for performing Wasm transformations specific to ICP canisters"
  homepage "https://github.com/dfinity/ic-wasm"
  url "https://github.com/dfinity/ic-wasm/archive/refs/tags/0.9.9.tar.gz"
  sha256 "43ca2645d6bdee3fd2090fa75520887e03568f5f34a6f74a8cf13e1b811d61df"
  license "Apache-2.0"
  revision 1

  bottle do
    root_url "https://github.com/raymondk/homebrew-icp-cli/releases/download/ic-wasm-0.9.9_1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "62b4c2535092d36d604ec5f5a0c213bc59ae58f32adeae420718ef23bf88f646"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "dd1f6380a798cc4f721610f15af1b4c6965613a76f2f2d94e52f5d06ae878464"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "66ed744e7cd6a8560ff377ae4eea05ce5eeb638b46fed46bcfce3150997850c4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
