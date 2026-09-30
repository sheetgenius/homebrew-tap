class Glowy < Formula
  desc "Mermaid diagrams in glow"
  homepage "https://github.com/sheetgenius/glowy"
  url "https://github.com/sheetgenius/glowy/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "97de7280e29c76446daff681069e288987772f192fcdbbec2b9d18d5b24cabf8"
  license "MIT"
  head "https://github.com/sheetgenius/glowy.git", branch: "main"

  depends_on "glow"
  depends_on "sheetgenius/tap/mermaid-ascii"

  uses_from_macos "python"

  def install
    bin.install "glowy"
  end

  test do
    output = pipe_output("#{bin}/glowy -", "```mermaid\ngraph LR\n  A --> B\n```\n")
    assert_match "►", output
  end
end
