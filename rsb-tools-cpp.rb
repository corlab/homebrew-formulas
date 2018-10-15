require 'formula'

class RsbToolsCpp < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.tools-cpp', :using => :git, :branch => '0.17'
  version '0.17'
  head 'https://code.cor-lab.org/git/rsb.git.tools-cpp', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'rsb'

  def install
    ENV.universal_binary if build.universal?
    args = std_cmake_args

    system "cmake", ".", "-DBUILD_TESTS=OFF", *args
    system "make install"
  end

  def test
    system "rsb-loggercpp" + version, "--help"
  end
end
