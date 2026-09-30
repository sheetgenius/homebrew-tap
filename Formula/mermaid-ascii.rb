class MermaidAscii < Formula
  desc "Render Mermaid diagrams as ASCII/Unicode art in the terminal"
  homepage "https://github.com/AlexanderGrooff/mermaid-ascii"
  version "1.6.1"
  license "MIT"

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

  def install
    bin.install "mermaid-ascii"
  end

  test do
    output = pipe_output(bin/"mermaid-ascii", "graph LR\n  A --> B\n")
    assert_match "A", output
  end
end
