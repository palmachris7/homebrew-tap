class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.15.tar.gz"
  sha256 "15add0f4aade920f938c4dcc89dca3bdd08b75bf939865ac3db0277dd053f608"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.15/pal-v0.1.15-arm64.tar.gz"
  sha256 "bc5fd8aa0ce3555e95ed74014963c06dc59f384255eadd029dafa46268c60ed3"
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