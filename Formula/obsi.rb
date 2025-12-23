class Obsi < Formula
  desc "CLI for Obsidian note-taking (Quick Notes Fork)"
  homepage "https://github.com/avi8or/obsidian-cli-quick-notes"
  url "https://github.com/avi8or/obsidian-cli-quick-notes/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fbdf71ad0be374afa9c397f9f8696865ef6a0c2fe3443bd03292adf3b0a45d83"
  license "MIT"
  version "0.3.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"obsi"
    bin.install_symlink "obsi" => "obsidian-cli"
  end

  test do
    assert_match "v0.3.0", shell_output("#{bin}/obsi --version")
  end
end
