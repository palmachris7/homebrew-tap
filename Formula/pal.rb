class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "a46cef32d58ebbfd8618d1d12739729ec5dbdd7eb5cc26e5d3d90cd71514f636"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.11/pal-v0.1.11-arm64.tar.gz"
  sha256 "4d257b5f802bcd64b9cf81935349c3dc81737500b9b990d1ede7eef8b5101839"
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