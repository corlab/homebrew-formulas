require 'formula'

class RstConvertersAT018 < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-system-types'
  url 'https://code.cor-lab.de/git/rst.git.converters.git', :using => :git, :branch => '0.18'
  version '0.18'
  head 'https://code.cor-lab.de/git/rst.git.converters.git', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'rci' => :optional
  depends_on 'opencv' => :optional
  depends_on 'rsb@0.18'
  depends_on 'rst-proto@0.18'

  def install
    ENV.universal_binary if build.universal?

    system "cmake", "./cpp", *std_cmake_args
    system "make install"
  end

  def test
    system "rsb-infocpp" + version + " --plugins | grep rstconverters"
  end
end
