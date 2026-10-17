class Musik < Formula
  desc "Apple Music TUI player"
  homepage "https://github.com/palmachris7/musik"
  url "https://github.com/palmachris7/musik/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "4715bf0a1e4d40590478aa7088c804a9e5adac4bc308e73937bfaecaf0a7686c"
  license "MIT"
  depends_on "rust" => :build

  # Apple Silicon: binario directo del release, sin compilar.
  on_arm do
    url "https://github.com/palmachris7/musik/releases/download/v0.1.5/musik-v0.1.5-arm64.tar.gz"
  sha256 "57653d8d5c3a595503e385f25d0a14598b7997707a8c4e405c1548f9a79bb7fe"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "musik"
    else
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "musik", shell_output("#{bin}/musik version")
  end
end
