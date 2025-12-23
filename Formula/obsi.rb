class Obsi < Formula
  desc "CLI for Obsidian note-taking (Quick Notes Fork)"
  homepage "https://github.com/avi8or/obsidian-cli-quick-notes"
  url "https://github.com/avi8or/obsidian-cli-quick-notes/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "ca994609750b980fa3551fb2845f8a42d8cd7a104fd808010861e6160184122e"
  license "MIT"
  version "0.3.1"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"obsi"
    bin.install_symlink "obsi" => "obsidian-cli"
  end

  test do
    assert_match "v0.3.1", shell_output("#{bin}/obsi --version")
  end
end
