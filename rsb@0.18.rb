require 'formula'

class RsbAT018 < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.cpp', :using => :git, :branch => '0.18'
  version '0.18'
  head 'https://code.cor-lab.org/git/rsb.git.cpp', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'rsc@0.18'
  depends_on 'rsb-protocol@0.18'

  def install
    ENV.universal_binary if build.universal?
    args = std_cmake_args
    # we have to work around the cellar structure and the plugin load path here
    args.reject{ |item| item =~ /CMAKE_INSTALL_PREFIX/i}
    args = args + %W[
      -DBUILD_TESTS=OFF
      -DBUILD_EXAMPLES=OFF
      -DCMAKE_INSTALL_PREFIX='#{HOMEBREW_PREFIX}'
    ]
    system "cmake", ".", *args
    system "make DESTDIR=#{prefix} install"
    mv Dir["#{prefix}/usr/local/*"], "#{prefix}"
  end

  def test
    system "rsb-infocpp" + version
  end
end
