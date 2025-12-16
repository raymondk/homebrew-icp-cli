class IcWasm < Formula
  desc "A CLI for performing Wasm transformations specific to canisters running on the Internet Computer"
  homepage "https://github.com/dfinity/ic-wasm"
  version "0.9.9"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dfinity/ic-wasm/releases/download/dist4/0.9.9/ic-wasm-aarch64-apple-darwin.tar.xz"
      sha256 "dca19b416b8b69aff6c74de24f48feeddfb43703f8c3151976d1c3f70ed5a188"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dfinity/ic-wasm/releases/download/dist4/0.9.9/ic-wasm-x86_64-apple-darwin.tar.xz"
      sha256 "1ebb884a66a16b4930e577cb7f43e614a0bec83ec81f574eaa0ab70e48f3992a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/dfinity/ic-wasm/releases/download/dist4/0.9.9/ic-wasm-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2ad52e7de2dfcda11f1c62a5ea6a0eb0fc18c4c54185124b90cbc9e194e9044b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dfinity/ic-wasm/releases/download/dist4/0.9.9/ic-wasm-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "763f2963f36cc6d82a5379767579213f7902651ebf456fa8db66391685e107e9"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ic-wasm"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "ic-wasm"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "ic-wasm"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "ic-wasm"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
