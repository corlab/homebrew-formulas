require 'formula'

class RsbYarpCpp < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.yarp-cpp', :using => :git, :branch => '0.17'
  version '0.17'
  head 'https://code.cor-lab.org/git/rsb.git.yarp-cpp', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'rsc'
  depends_on 'rsb-protocol'

  def install
    ENV.universal_binary if build.universal?
    args = std_cmake_args

    system "cmake", ".", *args
    system "make install"
  end

  def test
    system "rsb-infocpp" + version + " --plugins | grep rsbyarp"
  end
end
