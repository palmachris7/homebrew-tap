class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "29c1d80297b23072955d507a0d9dc8d2918ec91b3db181b7394d8fd1af7f12ef"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.16/pal-v0.1.16-arm64.tar.gz"
  sha256 "50b805ca3a6b16c10782be62f61c13bd21268dd55486aefe952db889fd9230ba"
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