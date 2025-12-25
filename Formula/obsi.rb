class Obsi < Formula
  desc "CLI for Obsidian note-taking (Quick Notes Fork)"
  homepage "https://github.com/avi8or/obsidian-cli-quick-notes"
  url "https://github.com/avi8or/obsidian-cli-quick-notes/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "9485b3c7d7e44cfdb9516d8403ffc5fb8d15ca8d8b1810da2c6f8a9943202a56"
  license "MIT"
  version "0.3.2"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"obsi"
    bin.install_symlink "obsi" => "obsidian-cli"
  end

  test do
    assert_match "v0.3.2", shell_output("#{bin}/obsi --version")
  end
end
