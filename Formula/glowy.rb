class Glowy < Formula
  desc "Mermaid diagrams in glow"
  homepage "https://github.com/sheetgenius/glowy"
  url "https://github.com/sheetgenius/glowy/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "461a8365739dac3790ecc355ee20cc04f8ba2121a451d94487d8e47bc0bcb6b2"
  license "MIT"
  head "https://github.com/sheetgenius/glowy.git", branch: "main"

  depends_on "glow"

  uses_from_macos "python"

  # mermaid-ascii isn't in homebrew-core. It's bundled rather than a separate
  # tap formula because tap trust only covers the formula named on the command
  # line, not its dependencies from the same tap.
  resource "mermaid-ascii" do
    on_macos do
      on_arm do
        url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.6.1/mermaid-ascii_Darwin_arm64.tar.gz"
        sha256 "9b7f7788bd2596437d92856e9a60b7b05ecb5f6f786c8c0b1cb369f742bf8063"
      end
      on_intel do
        url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.6.1/mermaid-ascii_Darwin_x86_64.tar.gz"
        sha256 "a0fc7b8dc4f01d0ad0afff16590d63b8a85d157cc957b2a659ffeca617360bdc"
      end
    end

    on_linux do
      on_arm do
        url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.6.1/mermaid-ascii_Linux_arm64.tar.gz"
        sha256 "b166e0b4a0c34e31068c7629333e887742af714bb42966db08adf861eb352139"
      end
      on_intel do
        url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.6.1/mermaid-ascii_Linux_x86_64.tar.gz"
        sha256 "9c2844824635415982a8d34be301a0abb1f64599f019892f7d844c4620ce8d41"
      end
    end
  end

  def install
    resource("mermaid-ascii").stage { libexec.install "mermaid-ascii" }
    inreplace "glowy", 'MERMAID_ASCII = "mermaid-ascii"', "MERMAID_ASCII = \"#{opt_libexec}/mermaid-ascii\""
    bin.install "glowy"
  end

  test do
    output = pipe_output("#{bin}/glowy -", "```mermaid\ngraph LR\n  A --> B\n```\n")
    assert_match "►", output
  end
end
