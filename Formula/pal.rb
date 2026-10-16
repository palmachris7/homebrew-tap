class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.18.tar.gz"
  sha256 "9f0c621d45098e63d0e1a9cf51fe25c154bc65de7e4672c2638845bbd9b754b1"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.18/pal-v0.1.18-arm64.tar.gz"
  sha256 "fb69b3ff7d6461cbd776be93fbd84c9ba30b6062ca75f102f277e23b8b670718"
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