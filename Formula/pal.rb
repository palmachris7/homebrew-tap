class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.17.tar.gz"
  sha256 "3b6017e76a38eba901d05a6f649e16a54939049257bd6317a1032f4bfc966c2b"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.17/pal-v0.1.17-arm64.tar.gz"
  sha256 "e0fe31e34240eba963d04aa7b964f9447cc1c1c9f3b82863b94eff2d13003925"
  end

  depends_on "rust" => :build unless Hardware::CPU.arm?

  def install
    if Hardware::CPU.arm?
      bin.install "pal"
    else
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "pal", shell_output("#{bin}/pal --version")
  end
end