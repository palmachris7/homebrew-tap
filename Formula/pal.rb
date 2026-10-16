class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "88bb12a7784576422f9c3dae023969feb76c96209d96f4f8f7e0ff2568f698d3"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.13/pal-v0.1.13-arm64.tar.gz"
  sha256 "d9947daa08185c23231eafdce3e2a202cca9cd9720133002939f0104a8897eee"
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