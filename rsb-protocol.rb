require 'formula'

class RsbProtocol < Formula
  homepage 'https://code.cor-lab.org/projects/rsb'
  url 'https://code.cor-lab.org/git/rsb.git.protocol', :using => :git, :branch => '0.17'
  version '0.17'
  head 'https://code.cor-lab.org/git/rsb.git.protocol', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'protobuf'
  depends_on 'rsc' => :build

  def install
    ENV.universal_binary if build.universal?
    ENV.no_optimization

    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "ls", "/usr/local/share/rsbprotocol" + version
  end
end
