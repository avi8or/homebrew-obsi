class Obsi < Formula
  desc "CLI for Obsidian note-taking (Quick Notes Fork)"
  homepage "https://github.com/avi8or/obsidian-cli-quick-notes"
  url "https://github.com/avi8or/obsidian-cli-quick-notes/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "5d2eb9d6697724f48b746878e2ad20cc68ebc9ce1df116fea5236f6e43b0d6c1"
  license "MIT"
  version "0.3.4"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"obsi"
    bin.install_symlink "obsi" => "obsidian-cli"
  end

  test do
    assert_match "v0.3.4", shell_output("#{bin}/obsi --version")
  end
end
