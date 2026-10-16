class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.14.tar.gz"
  sha256 "78d9d8cf00e7708977bca5e90a79a8d426ce03cbf088d66f850986785432652d"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.14/pal-v0.1.14-arm64.tar.gz"
  sha256 "16d416302a6384d5dedabf1b964a7ff7d74c73a390fd3f9eeeaab1bf9cc2b307"
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