class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "d86bf4643527168a4f636ef55a3a6811bebc94ea139eb736a8eb9a51e6f1ce83"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.10/pal-v0.1.10-arm64.tar.gz"
  sha256 "b9e3533f2c5a0f59ddd5c5f71aa885680e429be636d667bd66c41133a9aa5445"
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