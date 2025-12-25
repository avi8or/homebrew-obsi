class Obsi < Formula
  desc "CLI for Obsidian note-taking (Quick Notes Fork)"
  homepage "https://github.com/avi8or/obsidian-cli-quick-notes"
  url "https://github.com/avi8or/obsidian-cli-quick-notes/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "1384b6135a8ef50983a48ea90df939803dedcf161592a2d085eba026e9669856"
  license "MIT"
  version "0.1.1"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"obsi"
    bin.install_symlink "obsi" => "obsidian-cli"
  end

  test do
    assert_match "v0.1.1", shell_output("#{bin}/obsi --version")
  end
end
