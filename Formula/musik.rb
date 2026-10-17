class Musik < Formula
  desc "Apple Music TUI player"
  homepage "https://github.com/palmachris7/musik"
  url "https://github.com/palmachris7/musik/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "e6e0eac8a093af3d0ff3ed13de0dfbd7fbb142698b2c7bbdb253cd1f5d8313b1"
  license "MIT"
  depends_on "rust" => :build

  # Apple Silicon: binario directo del release, sin compilar.
  on_arm do
    url "https://github.com/palmachris7/musik/releases/download/v0.1.4/musik-v0.1.4-arm64.tar.gz"
  sha256 "18f8f409cc19a1d3a449fb37863c3d6bc9deb394fbfb1d14f950a584bdd92c3c"
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
