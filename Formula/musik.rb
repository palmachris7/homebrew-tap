class Musik < Formula
  desc "Apple Music TUI player"
  homepage "https://github.com/palmachris7/musik"
  url "https://github.com/palmachris7/musik/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0960b8a6ca8ed9f9045ba77cad7ea1418c140749317c87cb07c31868df11a51d"
  license "MIT"
  depends_on "rust" => :build

  # Apple Silicon: binario directo del release, sin compilar.
  on_arm do
    url "https://github.com/palmachris7/musik/releases/download/v0.1.3/musik-v0.1.3-arm64.tar.gz"
  sha256 "47c1ca86af83e84e9a50e702a61079272d0520114965b3731a86f03adc9054e8"
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
