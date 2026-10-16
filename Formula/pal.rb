class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "bfdc020099c8a5034af3a11239bca77bd0073f1ac6b2846de88ce5edccc45621"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.7/pal-v0.1.7-arm64.tar.gz"
    sha256 "4bd8925a6f58b8dab16e236eb517f6860dc12a79ad1068a4b5b78a214ba6f956"
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