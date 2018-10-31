require 'formula'

class SpreadPython < Formula
  homepage 'http://www.spread.org/'
  url 'http://www.spread.org/files/SpreadModule-1.5spread4.tgz'
  sha256 'd122068c330877839bcdf37be716eba7e1ec6bb4aeaf43f39644cdbc258a5269'
  version '1.5.0'

  option :universal

  depends_on 'python@2'
  depends_on 'spread'

  include Language::Python::Virtualenv
  def install
    ENV.universal_binary if build.universal?
    venv = virtualenv_create(libexec)
    system "python2", *Language::Python.setup_install_args(prefix)
  end

  def test
    system "python2 -c \"import spread\""
  end
end
