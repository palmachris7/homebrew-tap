class Musik < Formula
  desc "Apple Music TUI player"
  homepage "https://github.com/palmachris7/musik"
  url "https://github.com/palmachris7/musik/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "90f211bc9aaaab30dbb7d15e2eb021163b4c6b58351f57d72cb1465b84cbe0ea"
  license "MIT"
  depends_on "rust" => :build

  # Apple Silicon: binario directo del release, sin compilar.
  on_arm do
    url "https://github.com/palmachris7/musik/releases/download/v0.1.1/musik-v0.1.1-arm64.tar.gz"
    sha256 "f6095b0b0c6adf7fb1aa062a05ab62a466c403903a40d016c7cfefd8879fd6c1"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "musik"
    else
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "musik", shell_output("#{bin}/musik version")
  end
end
