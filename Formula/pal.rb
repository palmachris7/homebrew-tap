class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ad63223728ee0d6a0faa57a80c8b417e7f1e578ae1ae4ecf839316386f013137"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.3/pal-v0.1.3-arm64.tar.gz"
    sha256 "f113b48ec92d154b2bf5d5aecfc0fee6d2977ca1106f9ef7d8211ceecac84a88"
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