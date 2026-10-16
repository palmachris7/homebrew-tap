class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "b88c9ed97cda780096d594a4cd0be594296ed66e4d06e39f4b39d7d2dc9f5ba0"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.8/pal-v0.1.8-arm64.tar.gz"
  sha256 "d71adc40c5a3d46843f6cd16a7455b1744b78e0008b4f7dedaaf1a1e90f03d13"
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