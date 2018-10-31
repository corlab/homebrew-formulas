require 'formula'

class RsbSpreadCpp < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.spread-cpp', :using => :git, :branch => '0.17'
  version '0.17'
  head 'https://code.cor-lab.org/git/rsb.git.spread-cpp', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'spread'
  depends_on 'rsb'
  depends_on 'rsc'

  def install
    ENV.universal_binary if build.universal?
    args = std_cmake_args

    system "cmake", ".", "-DBUILD_TESTS=OFF", "-DBUILD_EXAMPLES=OFF", *args
    system "make install"
  end

  def test
    system "rsb-infocpp" + version + " --plugins | grep rsbspread"
  end
end
