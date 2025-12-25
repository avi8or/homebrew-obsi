class Obsi < Formula
  desc "CLI for Obsidian note-taking (Quick Notes Fork)"
  homepage "https://github.com/avi8or/obsidian-cli-quick-notes"
  url "https://github.com/avi8or/obsidian-cli-quick-notes/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "5ce64b703da07ee6d51fc80a12431d42c4087426262dea56f3d9cbb8eb1bfd32"
  license "MIT"
  version "0.1.2"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"obsi"
    bin.install_symlink "obsi" => "obsidian-cli"
  end

  test do
    assert_match "v0.1.2", shell_output("#{bin}/obsi --version")
  end
end
