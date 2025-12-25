class Obsi < Formula
  desc "CLI for Obsidian note-taking (Quick Notes Fork)"
  homepage "https://github.com/avi8or/obsidian-cli-quick-notes"
  url "https://github.com/avi8or/obsidian-cli-quick-notes/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "1dcd168726d9a84647f938dac4e87f808329d2ca0bfb988141e616934044d48f"
  license "MIT"
  version "0.3.3"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"obsi"
    bin.install_symlink "obsi" => "obsidian-cli"
  end

  test do
    assert_match "v0.3.3", shell_output("#{bin}/obsi --version")
  end
end
