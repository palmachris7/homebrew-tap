class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "b6b0d1adfaa9c3b171d7c504d750143e83da184e6792d3cd17a29c2723431d9e"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.12/pal-v0.1.12-arm64.tar.gz"
  sha256 "133f4a8ae8b9625495d4edc47c11cc876ef45d3d21549f0928fc9985f3a99024"
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