class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.19.tar.gz"
  sha256 "1fc0afa88f0d63721b25bfce86b191508db7df179f528e49620e6f88528c7ffd"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.19/pal-v0.1.19-arm64.tar.gz"
  sha256 "ad4fee5492d4b95ae8ce57060f09e37da9222c3166789c5ce9abb1de4f33dc78"
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