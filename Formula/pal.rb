class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "4af4fcca95c442b265646935ee8a5110eae7a827191ed73c02ac3d84d1c36779"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.4/pal-v0.1.4-arm64.tar.gz"
    sha256 "8748eddcf8e8266eaa1a6b4d56c06483af82ecb8f6b409bd5dbf4e36af89fae0"
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