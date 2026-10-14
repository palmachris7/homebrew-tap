class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d2c690e3a0b3974563c255810c5637e1650981c129ce337912786310f5381567"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.1/pal-v0.1.1-arm64.tar.gz"
    sha256 "38ab2edd623cbad93833742b9d7e222aea69c21ac63df5727541e0cf3a2b57e1"
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
