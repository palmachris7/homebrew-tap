class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "081951b77ce90c0c51255b1f851ac387a60020f9239e4963282a620f50d8be34"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.6/pal-v0.1.6-arm64.tar.gz"
    sha256 "8fb30ab0ad5cb7698f0ef56c0696f41da4bc0c805569b27d817b9dbf83850ae4"
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