class IcWasm < Formula
  desc "A CLI for performing Wasm transformations specific to canisters running on the Internet Computer"
  homepage "https://github.com/dfinity/ic-wasm"
  version "0.9.9"
  url "https://github.com/dfinity/ic-wasm/archive/refs/tags/#{version}.tar.gz"
  sha256 "43ca2645d6bdee3fd2090fa75520887e03568f5f34a6f74a8cf13e1b811d61df"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
