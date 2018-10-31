require 'formula'

class RsbPython < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/robotics-service-bus'
  url 'https://code.cor-lab.org/git/rsb.git.python', :using => :git, :branch => '0.17'
  version '0.17'
  head 'https://code.cor-lab.org/git/rsb.git.python', :using => :git

  option :universal

  depends_on 'spread-python'
  depends_on 'python@2'
  depends_on 'rsc'
  depends_on 'rsb-protocol'
  depends_on 'protobuf' => '--with-python'

  include Language::Python::Virtualenv
  def install
    ENV.universal_binary if build.universal?
    venv = virtualenv_create(libexec)
    system 'python2 setup.py proto --protocolroot=/usr/local/share/rsbprotocol0.17'
    system 'python2', *Language::Python.setup_install_args(prefix)
  end

  def test
    system "python2 -c \"import rsb\""
  end
end
