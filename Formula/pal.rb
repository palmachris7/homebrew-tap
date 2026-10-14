class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0c2b314cf0d546f78a5f78d5bd78b14cad41244b8f91c59133a2d80e9214c75c"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.0/pal-v0.1.0-arm64.tar.gz"
    sha256 "6f37e8d1964f63773e6159db25ea4dedf49d786502cfd23460547a61cf60b9ad"
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
