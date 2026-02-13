class PythonYubihsm < Formula
  include Language::Python::Virtualenv

  desc "Python library and tests for the YubiHSM 2"
  homepage "https://developers.yubico.com/python-yubihsm/"
  url "https://github.com/Yubico/python-yubihsm/releases/download/3.1.1/yubihsm-3.1.1.tar.gz"
  sha256 "990c30bf3565d3f2eac88778f88f1fb481dcb826481dbb27510d21d71daea11a"
  license "Apache-2.0"

  depends_on "cryptography"
  depends_on "python@3.14"
  depends_on "sparkworx/stuff/yubihsm-shell"

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  resource "pyusb" do
    url "https://files.pythonhosted.org/packages/00/6b/ce3727395e52b7b76dfcf0c665e37d223b680b9becc60710d4bc08b7b7cb/pyusb-1.3.1.tar.gz"
    sha256 "3af070b607467c1c164f49d5b0caabe8ac78dbed9298d703a8dbf9df4052d17e"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
  end

  def install
    # Ensure SOURCE_DATE_EPOCH is >= 1980 for ZIP compatibility when pip
    # builds hatchling (urllib3's build backend) from source in isolation.
    ENV["SOURCE_DATE_EPOCH"] = "315532800" if ENV["SOURCE_DATE_EPOCH"].to_i < 315532800

    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      This formula may conflict with the yubihsm2-sdk cask, which installs
      the same components via Yubico's installer package. If you have the
      cask installed, run: brew uninstall --cask yubihsm2-sdk
    EOS
  end

  test do
    assert_match version.to_s,
                 shell_output("#{libexec}/bin/python -c 'import yubihsm; print(yubihsm.__version__)'")
  end
end
