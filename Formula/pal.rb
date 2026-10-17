class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.20.tar.gz"
  sha256 "f3b14593d2d33d44035d749066e9550f1f6e6d94108b5ecece844e24a2683e28"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.20/pal-v0.1.20-arm64.tar.gz"
  sha256 "50fe768978be8c23d41379e0e6c7f28bae73c1b12939755896c4a8f8cfa19157"
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