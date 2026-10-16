class Musik < Formula
  desc "Apple Music TUI player"
  homepage "https://github.com/palmachris7/musik"
  url "https://github.com/palmachris7/musik/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "b461ea46327d96010f2ef592d368ee7403342629464df48af592bef657afc193"
  license "MIT"
  depends_on "rust" => :build

  # Apple Silicon: binario directo del release, sin compilar.
  on_arm do
    url "https://github.com/palmachris7/musik/releases/download/v0.1.2/musik-v0.1.2-arm64.tar.gz"
  sha256 "16f228d99cd43e34d21163a52a4a93f0992d4099c308627fa13b4056a5ab12e5"
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
