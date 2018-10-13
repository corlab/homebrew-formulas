require 'formula'

class RstProto < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-system-types'
  url 'https://code.cor-lab.de/git/rst.git.proto.git', :using => :git, :branch => '0.15'
  version '0.15'
  head 'https://code.cor-lab.de/git/rst.git.proto.git', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'rsc'
  depends_on 'protobuf'
  depends_on 'python'
  # FIX-ME this no longer works with brew
  #depends_on 'python' => ['google.protobuf' => 'protobuf']

  def install
    ENV.universal_binary if build.universal?

    system "cmake", ".", "-DBUILD_JAVA=OFF", "-DBUILD_MATLAB=OFF", *std_cmake_args
    system "make install"
  end

  def test
    system "ls", "/usr/local/share/rst" + version + "/proto/"
  end
end
