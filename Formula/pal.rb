class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "6e61df59a5dcebcbdecdf5b5b638b62273e56b270c3b8df56a13f4ea3bd8b02a"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.3/pal-v0.1.3-arm64.tar.gz"
    sha256 "701b8d093058290e77cbd08744d45d515528ebb2501de5724f1468b74f042a50"
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