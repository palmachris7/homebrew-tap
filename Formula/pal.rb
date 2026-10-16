class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "37543d95b82e4fa9677a4a6ff57fa1987196b2f7e26779e05328b2281ca78894"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.9/pal-v0.1.9-arm64.tar.gz"
  sha256 "0c60e02526333fe4487d61f92b3b79f2e080afb6dbff95d5fbc927dae003b560"
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