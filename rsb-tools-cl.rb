require 'formula'

class RsbToolsCl < Formula
  homepage 'https://code.cor-lab.org/projects/rsb'
  url 'https://ci.cor-lab.org/job/rsb-tools-cl-0.17-macos/label=MAC_OS_mavericks_64bit/lastSuccessfulBuild/artifact/build/rsb', :using => :nounzip
  sha256 '8a7194ae578ce25d2b47ce2303fdc4cf49661fe818e70dff765ea3cc768a71b5'
  version '0.17'

  def install
    bin.install 'rsb'
    ln_s bin/'rsb', bin/'rsb0.17'
  end

  def test
    system "rsb info", "-h"
  end
end
