require 'formula'

class RsbagToolsCl < Formula
  homepage 'https://code.cor-lab.org/projects/rsbag'
  url 'https://ci.cor-lab.org/job/rsbag-tools-cl-0.17-macos/label=MAC_OS_mavericks_64bit/lastSuccessfulBuild/artifact/build/rsbag', :using => :nounzip
  sha256 '9e877192ae889006bc69ae5657532f314ea89756da0e71415fde92d6a4712fe2'
  version '0.17'
  #head 'https://ci.cor-lab.org/view/rsx-trunk/job/rsbag-tools-cl-trunk-macos/label=MAC_OS_lion_64bit/lastSuccessfulBuild/artifact/build/rsbag', :using => :nounzip

  def install
    bin.install 'rsbag'
    ln_s bin/'rsbag', bin/'rsbag0.17'
  end

  def test
    system "rsbag play", "-h"
  end
end
