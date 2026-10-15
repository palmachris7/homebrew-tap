class Pal < Formula
  desc "Command finder and launcher"
  homepage "https://github.com/palmachris7/pal"
  url "https://github.com/palmachris7/pal/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "a82900b42c39fe5ac78449eb9e5a3bd04b7e14a9c0347ac23b24676600a97535"
  license "MIT"

  on_arm do
    url "https://github.com/palmachris7/pal/releases/download/v0.1.5/pal-v0.1.5-arm64.tar.gz"
    sha256 "340623b3d7a46dee701e6c8d0496ea96c3f42f63d6ef3c885291daa49311b448"
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