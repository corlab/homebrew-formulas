require 'formula'

class RsbProtocolAT018 < Formula
  homepage 'https://code.cor-lab.org/projects/rsb'
  url 'https://code.cor-lab.org/git/rsb.git.protocol', :using => :git, :branch => '0.18'
  version '0.18'
  head 'https://code.cor-lab.org/git/rsb.git.protocol', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'protobuf'
  depends_on 'rsc@0.18' => :build

  def install
    ENV.universal_binary if build.universal?
    ENV.no_optimization if ENV.compiler == :clang

    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "ls", "/usr/local/share/rsbprotocol" + version
  end
end
