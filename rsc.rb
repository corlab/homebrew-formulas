require 'formula'

class Rsc < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-systems-commons'
  url 'https://code.cor-lab.org/git/rsc.git', :using => :git, :branch => '0.17'
  version '0.17'
  head 'https://code.cor-lab.org/git/rsc.git', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'

  def install
    ENV.universal_binary if build.universal?

    system "cmake", ".", "-DBUILD_TESTS=OFF", "-DBUILD_EXAMPLES=OFF", *std_cmake_args
    system "make install"
  end

  def test
    system "ls", "/usr/local/lib/librsc" + version + ".dylib"
  end
end
