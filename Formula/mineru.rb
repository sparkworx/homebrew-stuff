class Mineru < Formula
  include Language::Python::Virtualenv

  desc "High-quality PDF/document extraction to Markdown and structured JSON"
  homepage "https://github.com/opendatalab/MinerU"
  # Upstream publishes no sdist, and their git tags are version-stale: the
  # `mineru-3.4.4-released` tag still carries __version__ = "3.4.3", because they tag
  # before bumping mineru/version.py. The PyPI wheel is the only artifact that actually
  # is 3.4.4, so take it directly.
  #
  # ON EVERY VERSION BUMP, re-check whether this is still true:
  #   curl -sL https://github.com/opendatalab/MinerU/archive/refs/tags/mineru-<v>-released.tar.gz \
  #     | tar xzO --include='*/mineru/version.py'
  # If that prints <v>, upstream has fixed their release process and this formula should
  # move back to the git tag tarball (the idiomatic source) and drop `using: :nounzip`.
  url "https://files.pythonhosted.org/packages/ec/d1/fd23b40d7bbdeaa04a6070ffeb21caff91c2c5a2c5fde22c7ce804f08dd8/mineru-3.4.4-py3-none-any.whl", using: :nounzip
  sha256 "d4d678539782a7683d998e2914a52d96b5720676ce65658b29666b1f4d9dfd13"
  # LicenseRef-MinerU-Open-Source-License: Apache-2.0 plus a commercial-use threshold
  # (>100M MAU or >$20M/mo revenue) and an attribution obligation. Non-SPDX, so it
  # cannot be represented -- this formula is intentionally tap-only.
  license :cannot_represent

  livecheck do
    url :stable
    strategy :pypi
  end

  # Apple Silicon only, macOS 14+. Every cp314 wheel in this stack (torch, mlx,
  # onnxruntime, torchvision) is tagged macosx_14_0_arm64, and mlx publishes no
  # macOS x86_64 wheel at any version.
  depends_on arch: :arm64
  depends_on "libyaml"
  # `depends_on macos: :sonoma` alone does NOT exclude Linux: MacOSRequirement#satisfy
  # short-circuits with `next true if version` when OS.mac? is false, so a versioned
  # macOS dependency reads as "macOS >= 14 (or Linux)". The bare `depends_on :macos` is
  # what actually makes Linux fail, and it is not redundant here -- the Homebrew/OSDependsOn
  # cop that flags it reasons about macOS-only *Cask* stanzas and misfires on formulae.
  # (Homebrew/OSDependsOn will flag the next line as redundant. It is wrong; see above.)
  depends_on :macos
  depends_on macos: :sonoma
  depends_on "numpy"
  depends_on "opencv"
  depends_on "python@3.14"
  depends_on "pytorch"

  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  resource "accelerate" do
    url "https://files.pythonhosted.org/packages/a8/db/253133d7e7cb40d3af384bb2f5c0b4a2b7fdcffbc95c688cc67a20a3c103/accelerate-1.14.0-py3-none-any.whl"
    sha256 "e94390c2863b873be18f623f9df48a0d8fe5eff13ea7f1a00092b0a7904888c6"
  end

  resource "aiofiles" do
    url "https://files.pythonhosted.org/packages/a5/45/30bb92d442636f570cb5651bc661f52b610e2eec3f891a5dc3a4c3667db0/aiofiles-24.1.0-py3-none-any.whl"
    sha256 "b4ec55f4195e3eb5d7abd1bf7e061763e864dd4954231fb8539a0ef8bb8260e5"
  end

  resource "aiohappyeyeballs" do
    url "https://files.pythonhosted.org/packages/71/43/1947f06babed6b3f1d7f38b0c767f52df66bfb2bc10b468c4a7de9eceff2/aiohappyeyeballs-2.7.1-py3-none-any.whl"
    sha256 "9243213661e29250eb41368e5daa826fc017156c3b8a11440826b2e3ed376472"
  end

  resource "aiohttp" do
    url "https://files.pythonhosted.org/packages/a6/26/4ff0164370deec18fb19254ee4ab10b7a73304ac0c860b13f5f84663759b/aiohttp-3.14.3-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "e72ee89e28d907a18f46959b4eb0bb06701cc7f8cf4366e00029e2ccfaaf5924"
  end

  resource "aiosignal" do
    url "https://files.pythonhosted.org/packages/fb/76/641ae371508676492379f16e2fa48f4e2c11741bd63c48be4b12a6b09cba/aiosignal-1.4.0-py3-none-any.whl"
    sha256 "053243f8b92b990551949e63930a839ff0cf0b0ebbe0597b0f3fb19e1a0fe82e"
  end

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/3e/30/e900b21425a860e195f32e37657aa1f7c7f2b1bfb26f03ca209b90933c06/annotated_doc-0.0.5-py3-none-any.whl"
    sha256 "117bac03a25ede5df5440e855b32d556049ca169ead221505badf432fed4b101"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/99/91/8acff4f5e50511b911bbccb72b8628a49c68ce14148cd9f6431094859a90/annotated_types-0.8.0-py3-none-any.whl"
    sha256 "f072f4d804ea359e4eaf198b1af7a8b0943881a87f31bb764f8bf219bb9419e0"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/da/35/f2287558c17e29fafc8ef3daf819bb9834061cfa43bff8014f7df7f63bdc/anyio-4.14.2-py3-none-any.whl"
    sha256 "9f505dda5ac9f0c8309b5e8bd445a8c2bf7246f3ce950121e45ea15bc41d1494"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/64/b4/17d4b0b2a2dc85a6df63d1157e028ed19f90d4cd97c36717afef2bc2f395/attrs-26.1.0-py3-none-any.whl"
    sha256 "c647aa4a12dfbad9333ca4e71fe62ddc36f4e63b2d260a37a8b83d2f043ac309"
  end

  resource "audioop-lts" do
    url "https://files.pythonhosted.org/packages/de/d4/94d277ca941de5a507b07f0b592f199c22454eeaec8f008a286b3fbbacd6/audioop_lts-0.2.2-cp313-abi3-macosx_10_13_universal2.whl"
    sha256 "fd3d4602dc64914d462924a08c1a9816435a2155d74f325853c1f1ac3b2d9800"
  end

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/88/c6/92fcd42f1ba33e1184263f25bfabf3d27c383410470f169e4b8163bf9c17/beautifulsoup4-4.15.0-py3-none-any.whl"
    sha256 "d6f88de62e1d4e38ecb1077eb9724cd0eff29d2a08ca16a401e9b9e93f117cf9"
  end

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/15/94/14cf3ec553edf78e5196289087ac52862c87ac179fa1cfdf1022ec366b79/boto3-1.43.64-py3-none-any.whl"
    sha256 "2b555e63ece57cffb1ab1666fa6c23a0957e61f9d19ea8424d6c884124c3fd98"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/3d/d1/f27d1a4fb571e102828a4672cb3d19e0409275eb92c701b67a85879c0b04/botocore-1.43.64-py3-none-any.whl"
    sha256 "f0a01c47d631ab95589c244566bca971294724b21862de1c12c7c3b0de236272"
  end

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/17/e1/298c2ddf786bb7347a1cd71d63a347a79e5712a7c0cba9e3c3458ebd976f/brotli-1.2.0-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "6c12dad5cd04530323e723787ff762bac749a7b256a5bece32b2243dd5c27b21"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/0b/a7/71ac2cff56fec219ed242bb11b8efb69fcc4bec75db06fb7bfe35de520e6/certifi-2026.7.22-py3-none-any.whl"
    sha256 "62f22742b58a1a33014a2b6b706588a8d7e2a88ae7bd1a6ebe8c992928483775"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/b3/a9/9db617d05d7367c1ad0ab00b3aa6e6f9281edd689b4ee9ea0e5a84e89c97/cffi-2.1.1-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "661c298b4821edebead0c91edd2b00374d67ad7c5a1f7a91d4442633b79d6a72"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/98/2b/f97f1c193fb855c345d678f5077d6926034db0722df74c8f057020e05a25/charset_normalizer-3.4.9-py3-none-any.whl"
    sha256 "68e5f26a1ad57ded6d1cfb85331d1c1a195314756471d97758c48498bb4dcdf5"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/fb/e2/79c688af8b210d232694e31e59da9f6ec747bae31c3f5946e4e9b98860d5/click-8.4.2-py3-none-any.whl"
    sha256 "e6f9f66136c816745b9d65817da91d61d957fb16e02e4dcd0552553c5a197b76"
  end

  resource "cobble" do
    url "https://files.pythonhosted.org/packages/d5/e1/3714a2f371985215c219c2a70953d38e3eed81ef165aed061d21de0e998b/cobble-0.1.4-py3-none-any.whl"
    sha256 "36c91b1655e599fd428e2b95fdd5f0da1ca2e9f1abb0bc871dec21a0e78a2b44"
  end

  resource "colorlog" do
    url "https://files.pythonhosted.org/packages/d4/19/0b6647bf5e331521e55d2b63bfbdc210bd9cd605189273f03614a05f702d/colorlog-6.12.0-py3-none-any.whl"
    sha256 "30d392604e9110045a2c2aeefc27d7a017abbab63f3a8aee594eac0801df784e"
  end

  resource "datasets" do
    url "https://files.pythonhosted.org/packages/44/0b/98fc6eb83333508ca5f44c52b3e287ea8137a0ad582714e2cbc67a02154b/datasets-5.0.1-py3-none-any.whl"
    sha256 "9fbf73688f8c18f7529b4fe592abd04015f81d1e58001e4bac73ffb2b39d7cc4"
  end

  resource "dill" do
    url "https://files.pythonhosted.org/packages/1e/77/dc8c558f7593132cf8fefec57c4f60c83b16941c574ac5f619abb3ae7933/dill-0.4.1-py3-none-any.whl"
    sha256 "1e1ce33e978ae97fcfcff5638477032b801c46c7c65cf717f95fbc2248f79a9d"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/12/b3/231ffd4ab1fc9d679809f356cebee130ac7daa00d6d6f3206dd4fd137e9e/distro-1.9.0-py3-none-any.whl"
    sha256 "7bffd925d65168f85027d8da9af6bddab658135b840670a223589bc0c8ef02b2"
  end

  resource "et-xmlfile" do
    url "https://files.pythonhosted.org/packages/c1/8b/5fe2cc11fee489817272089c4203e679c63b570a5aaeb18d852ae3cbba6a/et_xmlfile-2.0.0-py3-none-any.whl"
    sha256 "7a91720bc756843502c3b7504c77b8fe44217c85c537d85037f0f536151b2caa"
  end

  resource "fast-langdetect" do
    url "https://files.pythonhosted.org/packages/27/da/c621e64d4bc23f485468295bb7d4a5f2290ebb4d342c8dc448ab66808071/fast_langdetect-0.2.5-py3-none-any.whl"
    sha256 "8d5ff640d94d5f30bb7653c761adbb9122b617b03fa1f166b7cc16c35e484d0e"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/cb/03/10388a42375ee7e4ac9b94eb2c5c569c8b5795e377e701c9ac3ad63de890/fastapi-0.141.1-py3-none-any.whl"
    sha256 "bfb91aa2d334c61cb35ba9a116fc123b3d3df31640b801cf57a7a78ec3f603b3"
  end

  resource "fasttext-predict" do
    url "https://files.pythonhosted.org/packages/fc/0e/9defbb9385bcb1104cc1d686a14f7d9fafe5fe43f220cccb00f33d91bb47/fasttext_predict-0.9.2.4.tar.gz"
    sha256 "18a6fb0d74c7df9280db1f96cb75d990bfd004fa9d669493ea3dd3d54f84dbc7"
  end

  resource "ffmpy" do
    url "https://files.pythonhosted.org/packages/55/56/dd3669eccebb6d8ac81e624542ebd53fe6f08e1b8f2f8d50aeb7e3b83f99/ffmpy-1.0.0-py3-none-any.whl"
    sha256 "5640e5f0fd03fb6236d0e119b16ccf6522db1c826fdf35dcb87087b60fd7504f"
  end

  resource "filelock" do
    url "https://files.pythonhosted.org/packages/c1/e8/72f8cef9fdfeffe06213fe8508039396ee48daa0e3259457ed766173bfd6/filelock-3.32.2-py3-none-any.whl"
    sha256 "87dd94cf281e586d135fa51132b8e3d9a598b316e90377a288663c9321036c82"
  end

  resource "flatbuffers" do
    url "https://files.pythonhosted.org/packages/e8/2d/d2a548598be01649e2d46231d151a6c56d10b964d94043a335ae56ea2d92/flatbuffers-25.12.19-py2.py3-none-any.whl"
    sha256 "7634f50c427838bb021c2d66a3d1168e9d199b0607e6329399f04846d42e20b4"
  end

  resource "frozenlist" do
    url "https://files.pythonhosted.org/packages/9a/9a/e35b4a917281c0b8419d4207f4334c8e8c5dbf4f3f5f9ada73958d937dcc/frozenlist-1.8.0-py3-none-any.whl"
    sha256 "0c18a16eab41e82c295618a77502e17b195883241c563b00f0aa5106fc4eaa0d"
  end

  resource "fsspec" do
    url "https://files.pythonhosted.org/packages/e5/22/4222d7ddf3da30f363edaa98e329c2bce6c65497c9cb2810931c8b2c0fbc/fsspec-2026.6.0-py3-none-any.whl"
    sha256 "02e0b71817df9b2169dc30a16832045764def1191b43dcff5bb85bdee212d2a1"
  end

  resource "ftfy" do
    url "https://files.pythonhosted.org/packages/ab/6e/81d47999aebc1b155f81eca4477a616a70f238a2549848c38983f3c22a82/ftfy-6.3.1-py3-none-any.whl"
    sha256 "7c70eb532015cd2f9adb53f101fb6c7945988d023a085d127d1573dc49dd0083"
  end

  resource "gradio" do
    url "https://files.pythonhosted.org/packages/38/3c/1568ee82f0e4308612aaf964168e93b7f2adb64c3e77b7877fd397e773bf/gradio-6.8.0-py3-none-any.whl"
    sha256 "1ece9f3d075bec3da5a6e69c77fa03ddcf3b14af56a9ca843a499406c2b3afd6"
  end

  resource "gradio-client" do
    url "https://files.pythonhosted.org/packages/c2/49/86b919727b5d6574528d5d9e67c6455bb707a3654abc87d61d7f1d742395/gradio_client-2.2.0-py3-none-any.whl"
    sha256 "090f72106b41ba17dcf1b437db54a7bba4c406244f8b01210d5bf24b2af6a85d"
  end

  resource "gradio-pdf" do
    url "https://files.pythonhosted.org/packages/52/e8/e8c4e4261cc381807705b964aab40d95f345a4c1d9d7995afe6539cbd089/gradio_pdf-0.0.24-py3-none-any.whl"
    sha256 "b9b18eaf0e75e1394c33694e638dce6e2b8d82d0838674948148db832152ac5f"
  end

  resource "groovy" do
    url "https://files.pythonhosted.org/packages/28/27/3d6dcadc8a3214d8522c1e7f6a19554e33659be44546d44a2f7572ac7d2a/groovy-0.1.2-py3-none-any.whl"
    sha256 "7f7975bab18c729a257a8b1ae9dcd70b7cafb1720481beae47719af57c35fa64"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/04/4b/29cac41a4d98d144bf5f6d33995617b185d14b22401f75ca86f384e87ff1/h11-0.16.0-py3-none-any.whl"
    sha256 "63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86"
  end

  resource "hf-xet" do
    url "https://files.pythonhosted.org/packages/4b/69/55b8dcf636142ae660fec1869fcac14c4da2e8412e14d6eee1523be77e9f/hf_xet-1.6.0-cp38-abi3-macosx_11_0_arm64.whl"
    sha256 "f0906082d9932ae0c0057fa194041c22b4e2cdb46b2592ef3b91f020d62a081a"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/7e/f5/f66802a942d491edb555dd61e3a9961140fd64c90bce1eafd741609d334d/httpcore-1.0.9-py3-none-any.whl"
    sha256 "2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/2a/39/e50c7c3a983047577ee07d2a9e53faf5a69493943ec3f6a384bdc792deb2/httpx-0.28.1-py3-none-any.whl"
    sha256 "d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad"
  end

  resource "huggingface-hub" do
    url "https://files.pythonhosted.org/packages/a8/af/48ac8483240de756d2438c380746e7130d1c6f75802ef22f3c6d49982787/huggingface_hub-0.36.2-py3-none-any.whl"
    sha256 "48f0c8eac16145dfce371e9d2d7772854a4f591bcb56c9cf548accf531d54270"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/1e/5e/d4e9f1a599fb8e573b7b87160658329fbf28d19eac2718f51fc3def3aa5a/idna-3.18-py3-none-any.whl"
    sha256 "7f952cbe720b688055e3f87de14f5c3e5fdaa8bc3928985c4077ca689de849a2"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/62/a1/3d680cbfd5f4b8f15abc1d571870c5fc3e594bb582bc3b64ea099db13e56/jinja2-3.1.6-py3-none-any.whl"
    sha256 "85ece4451f492d0c13c5dd7c13a64681a86afae63a5f347908daf103ce6d2f67"
  end

  resource "jiter" do
    url "https://files.pythonhosted.org/packages/65/7a/c415453e5213001bf3b411ff65dec3d303b0e76a4a2cfea9768cd4960994/jiter-0.16.0-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "63efadc657488f45db1c676d81e704cac2abf3fdb892def1faea61db053127e2"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/14/2f/967ba146e6d58cf6a652da73885f52fc68001525b4197effc174321d70b4/jmespath-1.1.0-py3-none-any.whl"
    sha256 "a5663118de4908c91729bea0acadca56526eb2698e83de10cd116ae0f4e97c64"
  end

  resource "json-repair" do
    url "https://files.pythonhosted.org/packages/76/da/7f9e2b0a1120b107a204bbab6d0ef7ff2ae37790bddc5ee21c9c1f961f3b/json_repair-0.61.7-py3-none-any.whl"
    sha256 "45c99b8cffef404e846b60d3dc21fc6f0fd5a4595cebad169dfab083ffb8246a"
  end

  resource "loguru" do
    url "https://files.pythonhosted.org/packages/0c/29/0348de65b8cc732daa3e33e67806420b2ae89bdce2b04af740289c5c6c8c/loguru-0.7.3-py3-none-any.whl"
    sha256 "31a33c10c8e1e10422bfd431aeb5d351c7cf7fa671e3c4df004162264b28220c"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/13/e2/2e325795566de01d0d7c3bb57d3c370616b2d07b01214e84eec5d3b10963/lxml-6.1.1-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "19b7ab10b210b0b3ad7985d9ac4eb66ab09a90b20fe6e2f7ba55d01a234345d0"
  end

  resource "magika" do
    url "https://files.pythonhosted.org/packages/93/eb/24d94db0530029649b266ec3ca8221c07f2754f56046181f13237d2518f5/magika-1.0.3-py3-none-any.whl"
    sha256 "938d8e033953f2ddeb8c35dc423aa289ca116bfa7a71a778f6e77460f9025803"
  end

  resource "mammoth" do
    url "https://files.pythonhosted.org/packages/14/a4/0cce02ffb7c75211e7723250bf254c7a320a17368345859beba75637262a/mammoth-1.12.0-py2.py3-none-any.whl"
    sha256 "d195ae2403b98276d7646e252035b6f70adb255987bb267e9eac6bc6531fe38f"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/b3/81/4da04ced5a082363ecfa159c010d200ecbd959ae410c10c0264a38cac0f5/markdown_it_py-4.2.0-py3-none-any.whl"
    sha256 "9f7ebbcd14fe59494226453aed97c1070d83f8d24b6fc3a3bcf9a38092641c4a"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/b5/64/7660f8a4a8e53c924d0fa05dc3a55c9cee10bbd82b11c5afb27d44b096ce/markupsafe-3.0.3-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "c47a551199eb8eb2121d4f0f15ae0f923d31350ab9280078d1e5f12b249e0026"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/b3/38/89ba8ad64ae25be8de66a6d463314cf1eb366222074cfda9ee839c56a4b4/mdurl-0.1.2-py3-none-any.whl"
    sha256 "84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8"
  end

  resource "mineru-vl-utils" do
    url "https://files.pythonhosted.org/packages/a0/e6/71556a212ab86c8845f5bec220952e08ba288342593161da41076c678627/mineru_vl_utils-1.0.5-py3-none-any.whl"
    sha256 "cf910e68f0607634e61b613b7f5992daf604bf80b400d81e7b9f0f117b7c3c15"
  end

  resource "mlx" do
    url "https://files.pythonhosted.org/packages/99/65/208f511acd5fb1ed0b08f047bd6229583845cc6f4b5aa6547a3219332dbb/mlx-0.31.1-cp314-cp314-macosx_14_0_arm64.whl"
    sha256 "bba9d471ba20e050676292b1089a355c8042d3fc9462e4c1738a9735d7d40cfa"
  end

  resource "mlx-lm" do
    url "https://files.pythonhosted.org/packages/e5/53/913099c91d384e115ea078325efd9a0bc1ea3eb3458c694b4596cbd267f2/mlx_lm-0.29.1-py3-none-any.whl"
    sha256 "440941b3054c2a2216e97615de584cc90fa1ea874782e20699b9895721fad8dc"
  end

  resource "mlx-metal" do
    url "https://files.pythonhosted.org/packages/39/66/2313497fdbc7fbadf8e026c09366e3f049f9114e65ca4edc23cdb8699186/mlx_metal-0.31.1-py3-none-macosx_14_0_arm64.whl"
    sha256 "70741174131dbf7fdd479cb730e06e08c358eac3bf7905d9e884e7960cfdd5b8"
  end

  resource "mlx-vlm" do
    url "https://files.pythonhosted.org/packages/9d/76/d13985f2c42919d23d71549c92063ca749bfa6eea706fb08c14b6b5a0053/mlx_vlm-0.3.9-py3-none-any.whl"
    sha256 "fa94a450161ae3978ca71565b5364c4ce0e86f0c1fae98a24afaa43feb121c57"
  end

  resource "modelscope" do
    url "https://files.pythonhosted.org/packages/ee/c5/ff578b44a7ba5d86edfaae1ce7db9082f95477bd22ccb2514c1aee4636b7/modelscope-1.39.1-py3-none-any.whl"
    sha256 "c1567b9d319b11d815832d13c11f71a6413b19cf6374cef6937c54d830552a97"
  end

  resource "modelscope-hub" do
    url "https://files.pythonhosted.org/packages/ab/be/3b0e14c296a622c920287fc6d2c1b5a8668c8e0d98662f7b2bd8f3fcc779/modelscope_hub-0.2.0-py3-none-any.whl"
    sha256 "84668c80c1d36d1fb1ea1ce17b707d77e044b92255288618c3b7de5b13834418"
  end

  resource "mpmath" do
    url "https://files.pythonhosted.org/packages/43/e3/7d92a15f894aa0c9c4b49b8ee9ac9850d6e63b03c9c32c0367a13ae62209/mpmath-1.3.0-py3-none-any.whl"
    sha256 "a0b2b9fe80bbcd81a6647ff13108738cfb482d481d826cc0e02f5b35e5c88d2c"
  end

  resource "multidict" do
    url "https://files.pythonhosted.org/packages/81/08/7036c080d7117f28a4af526d794aab6a84463126db031b007717c1a6676e/multidict-6.7.1-py3-none-any.whl"
    sha256 "55d97cc6dae627efa6a6e548885712d4864b81110ac76fa4e534c03819fa4a56"
  end

  resource "multiprocess" do
    url "https://files.pythonhosted.org/packages/e3/45/8004d1e6b9185c1a444d6b55ac5682acf9d98035e54386d967366035a03a/multiprocess-0.70.19-py310-none-any.whl"
    sha256 "97404393419dcb2a8385910864eedf47a3cadf82c66345b44f036420eb0b5d87"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/9e/c9/b2622292ea83fbb4ec318f5b9ab867d0a28ab43c5717bb85b0a5f6b3b0a4/networkx-3.6.1-py3-none-any.whl"
    sha256 "d47fbf302e7d9cbbb9e2555a0d267983d2aa476bac30e90dfbe5669bd57f3762"
  end

  resource "onnxruntime" do
    url "https://files.pythonhosted.org/packages/4e/eb/952314c451d9463e5c9aed9978eec76cf32930d407d9ab8700dd0f4ea1ea/onnxruntime-1.28.0-cp314-cp314-macosx_14_0_arm64.whl"
    sha256 "8adff67a3f28257b37cfe945a7e952e4122666aa8c91a0380862e9fd4c2ed19f"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/78/0f/cc6afea3542a5142c5d8fc8211c5e059a8375105d004a41dfa2c7948dbb0/openai-2.53.0-py3-none-any.whl"
    sha256 "c694ffc747a3c4d1663ef2b07b811315a476164ee5efa3a993967349ebca7618"
  end

  resource "openpyxl" do
    url "https://files.pythonhosted.org/packages/c0/da/977ded879c29cbd04de313843e76868e6e13408a94ed6b987245dc7c8506/openpyxl-3.1.5-py2.py3-none-any.whl"
    sha256 "5282c12b107bffeef825f4617dc029afaf41d0ea60823bbb665ef3079dc79de2"
  end

  resource "orjson" do
    url "https://files.pythonhosted.org/packages/8e/eb/5da01e356015aee6ecfa1187ced87aef51364e306f5e695dd52719bf0e78/orjson-3.11.9-cp314-cp314-macosx_10_15_x86_64.macosx_11_0_arm64.macosx_10_15_universal2.whl"
    sha256 "b6ef1979adc4bc243523f1a2ba91418030a8e29b0a99cbe7e0e2d6807d4dce6e"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/63/34/ba1c580383c9eada3711951fef0795c80b829a078d72188184bcab9dd527/packaging-26.3-py3-none-any.whl"
    sha256 "d7193f7c8e4e93f444fde0262bf90af30e16fa0ad0ad44cb553c87339b23cd1c"
  end

  resource "pandas" do
    url "https://files.pythonhosted.org/packages/06/ec/5189518c7a7659c4bdcc6b1eb32c46c6f3c86b0661ffd84143d1112c7732/pandas-3.0.5-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "53730687fcd161883b24e10411c06d6a4c0f2275d2faf3bb2bc25deb4ba8007c"
  end

  resource "pdftext" do
    url "https://files.pythonhosted.org/packages/d7/5d/997add0ca9f74d77afd9ab355b301a495420ce0b3258bf6954b00aa47465/pdftext-0.7.1-py3-none-any.whl"
    sha256 "ffb47a36e7f0c9a295e16c0e0a9f6a323026f88416f8045330746604f7212986"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/c7/da/32c752228ae345f489e3a42499d817b6c3996da7e8a3bc7a04fc806b243b/pillow-12.3.0-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "e158cb00350dc278f3b91551101aa7d12415a66ebf2c91d8d5ac14e56ddd3ad0"
  end

  resource "propcache" do
    url "https://files.pythonhosted.org/packages/3a/ed/1cdcab6ba3d6ab7feca11fc14f0eeea80755bb53ef4e892079f31b10a25f/propcache-0.5.2-py3-none-any.whl"
    sha256 "be1ddfcbb376e3de5d2e2db1d58d6d67463e6b4f9f040c000de8e300295465fe"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/19/c7/5f7c636ec43e0c545e28d1f1db71990108306f7bdcb89f069ba97e428e7f/protobuf-7.35.1-py3-none-any.whl"
    sha256 "4bc97768d8fe4ad6743c8a19403e314511ed9f6d13205b687e52421c023ac1b9"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/80/c4/f5af4c1ca8c1eeb2e92ccca14ce8effdeec651d5ab6053c589b074eda6e1/psutil-7.2.2-cp36-abi3-macosx_11_0_arm64.whl"
    sha256 "1a7b04c10f32cc88ab39cbf606e117fd74721c831c98a27dc04578deb0c16979"
  end

  resource "pyarrow" do
    url "https://files.pythonhosted.org/packages/55/c7/581ccbcdb3d897eb2893328d68db3d52eca373bf2a7e964d0a6276b8e85b/pyarrow-25.0.0-cp314-cp314-macosx_12_0_arm64.whl"
    sha256 "72132b9a8a0a1840197794d4dea26080069b6b0981c116bc078762dc9691b21b"
  end

  resource "pyclipper" do
    url "https://files.pythonhosted.org/packages/1a/20/04d58c70f3ccd404f179f8dd81d16722a05a3bf1ab61445ee64e8218c1f8/pyclipper-1.4.0-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "7c87480fc91a5af4c1ba310bdb7de2f089a3eeef5fe351a3cedc37da1fcced1c"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0c/c3/44f3fbbfa403ea2a7c779186dc20772604442dde72947e7d01069cbe98e3/pycparser-3.0-py3-none-any.whl"
    sha256 "b727414169a36b7d524c1c3e31839a521725078d7b2ff038656844266160a992"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/fd/7b/122376b1fd3c62c1ed9dc80c931ace4844b3c55407b6fb2d199377c9736f/pydantic-2.13.4-py3-none-any.whl"
    sha256 "45a282cde31d808236fd7ea9d919b128653c8b38b393d1c4ab335c62924d9aba"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/ad/1f/8970b150a4b4365623ae00fc88603491f763c627311ae8031e3111356d6e/pydantic_core-2.46.4-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "23ace664830ee0bfe014a0c7bc248b1f7f25ed7ad103852c317624a1083af462"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/77/c1/6e422f34e569cf8e18df68d1939c81c099d2b61e4f7d9621c8a77560799c/pydantic_settings-2.14.2-py3-none-any.whl"
    sha256 "a20c97b37910b6550d5ea50fbcc2d4187defe58cd57070b73863d069419c9440"
  end

  resource "pydub" do
    url "https://files.pythonhosted.org/packages/a6/53/d78dc063216e62fc55f6b2eebb447f6a4b0a59f55c8406376f76bf959b08/pydub-0.25.1-py2.py3-none-any.whl"
    sha256 "65617e33033874b59d87db603aa1ed450633288aefead953b30bded59cb599a6"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/f4/7e/a72dd26f3b0f4f2bf1dd8923c85f7ceb43172af56d63c7383eb62b332364/pygments-2.20.0-py3-none-any.whl"
    sha256 "81a9e26dd42fd28a23a2d169d86d7ac03b46e2f8b59ed4698fb4785f946d0176"
  end

  resource "pylatexenc" do
    url "https://files.pythonhosted.org/packages/e7/06/3d67bd912ef337aa4856b466121d03f304aa1bb4d804f9298b6227cd227e/pylatexenc-2.11-py2.py3-none-any.whl"
    sha256 "e78e7391d6c104f1ed150e21cfaa58016cdb50aa54406a2eecb793649ffdfdd0"
  end

  resource "pypdf" do
    url "https://files.pythonhosted.org/packages/49/e6/136aa8993a2ae7214e0b0ef2edaa0d2e08d1d4e4982635b08a835ff31ec8/pypdf-6.14.2-py3-none-any.whl"
    sha256 "3f07891af76dc002657e04993ab9b4de81de29f9013b9761d0b7968bff12e946"
  end

  resource "pypdfium2" do
    url "https://files.pythonhosted.org/packages/a7/be/477548c026c2badfdbf4afc3358b7135121fb5bec2e2effcb67e3a674d0b/pypdfium2-5.10.1-py3-none-macosx_12_0_arm64.whl"
    sha256 "ebb9e63f92d15fc41b359fe7a187233dfae37548800e1fa09cb2fc466ac89951"
  end

  resource "pypptx-with-oxml" do
    url "https://files.pythonhosted.org/packages/fb/d8/940fcaa6a1f3763d72751b6bc8054f40beeacd6e9e5b19069c6c73dab5af/pypptx_with_oxml-1.0.3-py3-none-any.whl"
    sha256 "4b3ccf51185e0f9e60ebf2884e74153d7fcb00e7e4f0461404e96e0260d7bba1"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/ec/57/56b9bcc3c9c6a792fcbaf139543cee77261f3651ca9da0c93f5c1221264b/python_dateutil-2.9.0.post0-py2.py3-none-any.whl"
    sha256 "a8b2bc7bffae282281c8140a97d3aa9c14da0b136dfe83f850eea9a5f7470427"
  end

  resource "python-docx" do
    url "https://files.pythonhosted.org/packages/d0/00/1e03a4989fa5795da308cd774f05b704ace555a70f9bf9d3be057b680bcf/python_docx-1.2.0-py3-none-any.whl"
    sha256 "3fd478f3250fbbbfd3b94fe1e985955737c145627498896a8a6bf81f4baf66c7"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/0b/d7/1959b9648791274998a9c3526f6d0ec8fd2233e4d4acce81bbae76b44b2a/python_dotenv-1.2.2-py3-none-any.whl"
    sha256 "1d8214789a24de455a8b8bd8ae6fe3c6b69a5e3d64aa8a8e5d68e694bbcb285a"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/e1/04/e8135ebd1ad02c56ec633277529b2602ff99ff634be76cdba5744cf554fd/python_multipart-0.0.32-py3-none-any.whl"
    sha256 "ff6d3f776f16878c894e52e107296ffc890e913c611b1a4ec6c44e2821fe2e23"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/0f/7b/39c34ca613b0b198cb866466651b26b045e2009864c5183c979a3b83f383/pytz-2026.3.post1-py2.py3-none-any.whl"
    sha256 "dd95840dd199baea12d9cc096a1d452caa6596a1c1e4b5f3dbd1541855d5e815"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/bd/9c/4d95bb87eb2063d20db7b60faa3840c1b18025517ae857371c4dd55a6b3a/pyyaml-6.0.3-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "34d5fcd24b8445fadc33f9cf348c1047101756fd760b4dacb5c3e99755703310"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/d2/25/0c4c452f8ef3efe456745b2f33195f5904b573fb4c2ff3f0cb9ec188461e/regex-2026.7.19-cp314-cp314-macosx_10_13_universal2.whl"
    sha256 "a81758ed242b861b72e778ba34d41366441a2e10b16b472784c88da2dea7e2dd"
  end

  resource "reportlab" do
    url "https://files.pythonhosted.org/packages/a3/07/70085c17a369605f15e301d10ab902115019b1126c7253d964afc230c7d6/reportlab-5.0.0-py3-none-any.whl"
    sha256 "9d5a3affa84919e1111ede580031266a570e93b1ce388219621347965ff1d93c"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/a0/f4/c67b0b3f1b9245e8d266f0f112c500d50e5b4e83cb6f3b71b6528104182a/requests-2.34.2-py3-none-any.whl"
    sha256 "2a0d60c172f83ac6ab31e4554906c0f3b3588d37b5cb939b1c061f4907e278e0"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/82/3b/64d4899d73f91ba49a8c18a8ff3f0ea8f1c1d75481760df8c68ef5235bf5/rich-15.0.0-py3-none-any.whl"
    sha256 "33bd4ef74232fb73fe9279a257718407f169c09b78a87ad3d296f548e27de0bb"
  end

  resource "robust-downloader" do
    url "https://files.pythonhosted.org/packages/56/a1/779e9d0ebbdc704411ce30915a1105eb01aeaa9e402d7e446613ff8fb121/robust_downloader-0.0.2-py3-none-any.whl"
    sha256 "8fe08bfb64d714fd1a048a7df6eb7b413eb4e624309a49db2c16fbb80a62869d"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/bc/e7/5c595c75e9f41a44f30e526eda465ea0b4eec93470e074e4a111b253f13a/s3transfer-0.19.2-py3-none-any.whl"
    sha256 "d8168eccca828cbb2cd573675333f3bddd254313a9c42494b84c76b539e8ba25"
  end

  resource "safehttpx" do
    url "https://files.pythonhosted.org/packages/2e/a3/0f0b7d78e2f1eb9e8e1afbff1d2bff8d60144aee17aca51c065b516743dd/safehttpx-0.1.7-py3-none-any.whl"
    sha256 "c4f4a162db6993464d7ca3d7cc4af0ffc6515a606dfd220b9f82c6945d869cde"
  end

  resource "safetensors" do
    url "https://files.pythonhosted.org/packages/f5/b1/fa7c600e7dceae12e9606c7578cbc9ff1e1ed55844883ee5c92205e86226/safetensors-0.8.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "c80201d22cbf405b80647a60ada77bba06c8fba2da2743ba1e89cdcc39a81f25"
  end

  resource "semantic-version" do
    url "https://files.pythonhosted.org/packages/6a/23/8146aad7d88f4fcb3a6218f41a60f6c2d4e3a72de72da1825dc7c8f7877c/semantic_version-2.10.0-py2.py3-none-any.whl"
    sha256 "de78a3b8e0feda74cabc54aab2da702113e33ac9d9eb9d2389bcf1f58b7d9177"
  end

  resource "sentencepiece" do
    url "https://files.pythonhosted.org/packages/0b/7e/f5df63edb6bcb46c1343cfa5d9192d73a4eb61af2e800d9402efff387523/sentencepiece-0.2.2-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "c62bd361cec1f5b556eb8210264ecfff37486cd990c3386cc00310f26c54090a"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/5d/40/e1e72872c6354b306daef1703549e8e83b4d43cfea356311bf722a043752/setuptools-83.0.0-py3-none-any.whl"
    sha256 "29b23c360f22f414dc7336bb39178cc7bcbf6021ed2733cde173f09dba19abb3"
  end

  resource "shapely" do
    url "https://files.pythonhosted.org/packages/17/b9/f6ab8918fc15429f79cb04afa9f9913546212d7fb5e5196132a2af46676b/shapely-2.1.2-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "1ff629e00818033b8d71139565527ced7d776c269a49bd78c9df84e8f852190c"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/e0/f9/0595336914c5619e5f28a1fb793285925a8cd4b432c9da0a987836c7f822/shellingham-1.5.4-py2.py3-none-any.whl"
    sha256 "7ecfff8f2fd72616f7481040475a65b2bf8af90a56c89140852d1120324e8686"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/b7/ce/149a00dd41f10bc29e5921b496af8b574d8413afcd5e30dfa0ed46c2cc5e/six-1.17.0-py2.py3-none-any.whl"
    sha256 "4721f391ed90541fddacab5acf947aa0d3dc7d27b2e1e8eda2be8970586c3274"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/e9/44/75a9c9421471a6c4805dbf2356f7c181a29c1879239abab1ea2cc8f38b40/sniffio-1.3.1-py3-none-any.whl"
    sha256 "2f6da418d1f1e0fddd844478f41680e794e6051915791a034ff65e5f100525a2"
  end

  resource "soundfile" do
    url "https://files.pythonhosted.org/packages/b1/d1/5e338af9ca6ed0786cd5bb03f6d60de1c325728c1189014f3b59aae7403c/soundfile-0.14.0-py2.py3-none-any.whl"
    sha256 "8ba81ae3a89fd5ab3bef8a8eb481fbbe794e806309675a89b4df48b8d31908a8"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/0f/2c/437fe806897c2d6cfdc3ee43a18da8bf8e568530a4ae9bac781541ca9896/soupsieve-2.9.1-py3-none-any.whl"
    sha256 "4f4477399246b7a0c720a88ca2454b11cd6bb9ae4c9d170140786e916776c14c"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/81/0d/13d1d239a25cbfb19e740db83143e95c772a1fe10202dda4b76792b114dd/starlette-0.52.1-py3-none-any.whl"
    sha256 "0029d43eb3d273bc4f83a08720b4912ea4b071087a3b48db01b7c839f7954d74"
  end

  resource "sympy" do
    url "https://files.pythonhosted.org/packages/a2/09/77d55d46fd61b4a135c444fc97158ef34a095e5681d0a6c10b75bf356191/sympy-1.14.0-py3-none-any.whl"
    sha256 "e091cc3e99d2141a0ba2847328f5479b05d94a6635cb96148ccb3f34671bd8f5"
  end

  resource "tokenizers" do
    url "https://files.pythonhosted.org/packages/2e/47/174dca0502ef88b28f1c9e06b73ce33500eedfac7a7692108aec220464e7/tokenizers-0.22.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "1e418a55456beedca4621dbab65a318981467a2b188e982a23e117f115ce5001"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/bd/75/8539d011f6be8e29f339c42e633aae3cb73bffa95dd0f9adec09b9c58e85/tomlkit-0.13.3-py3-none-any.whl"
    sha256 "c89c649d79ee40629a9fda55f8ace8c6a1b42deb912b2a8fd8d942ddadb606b0"
  end

  resource "torchvision" do
    url "https://files.pythonhosted.org/packages/c5/b9/da40eca5bbe9596c12ae9899ab7abaf887f5e20f29d08b924b4633714821/torchvision-0.28.0-cp314-cp314-macosx_14_0_arm64.whl"
    sha256 "3bd9dba55224a9db4a2d77f6feaa5651770d8c8e86d3d0ddb0fa6bec54c8712b"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/f9/1c/01bfd571a64e7f270e6bab5e33777debe0edc56759233ce84f27dec92d14/tqdm-4.70.0-py3-none-any.whl"
    sha256 "7f585706bfddbdebf89daac705b2dfcc16890130727d3197ca62c732b4310953"
  end

  resource "transformers" do
    url "https://files.pythonhosted.org/packages/03/b8/e484ef633af3887baeeb4b6ad12743363af7cce68ae51e938e00aaa0529d/transformers-4.57.6-py3-none-any.whl"
    sha256 "4c9e9de11333ddfe5114bc872c9f370509198acf0b87a832a0ab9458e2bd0550"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/43/89/9518bc0c3929bee36b3a4a8e3daddd6e03f92f9961c66d4983b837160543/typer-0.27.1-py3-none-any.whl"
    sha256 "53150287edd11baeb4e4722c8e394fcdf8181c0ae89485cba8d25c778d5edd56"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/49/d3/b8441a820a491ddfc024b0b0cf0393375b75ea13866d9c66727e54c2fc80/typing_extensions-4.16.0-py3-none-any.whl"
    sha256 "481caa481374e813c1b176ada14e97f1f67a4539ce9cfeb3f350d78d6370c2e8"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/dc/9b/47798a6c91d8bdb567fe2698fe81e0c6b7cb7ef4d13da4114b41d239f65d/typing_inspection-0.4.2-py3-none-any.whl"
    sha256 "4ed1cacbdc298c220f1bd249ed5287caa16f34d44ef4e9c3d0cbad5b521545e7"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/7f/3e/5db95bcf282c52709639744ca2a8b149baccf648e39c8cc87553df9eae0c/urllib3-2.7.0-py3-none-any.whl"
    sha256 "9fb4c81ebbb1ce9531cce37674bbc6f1360472bc18ca9a553ede278ef7276897"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/c7/d5/68e6e9bca63c0badf67002890a46d3784c958de45b65e1275ec583ca1f06/uvicorn-0.52.1-py3-none-any.whl"
    sha256 "e4403f9d93188cf9d1088e9f40e3acd12630e2df8675316704379a7fc20fff6a"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/96/42/3e5985a0a7e57de470b320c6d6a1a67c844f6737a587f3d44dd13d1819e7/wcwidth-0.8.2-py3-none-any.whl"
    sha256 "d63947694a0539a1d51e01eda7caf800c291020e6cdd7e28ad7b14dd33ad4f85"
  end

  resource "xlsxwriter" do
    url "https://files.pythonhosted.org/packages/3a/0c/3662f4a66880196a590b202f0db82d919dd2f89e99a27fadef91c4a33d41/xlsxwriter-3.2.9-py3-none-any.whl"
    sha256 "9a5db42bc5dff014806c58a20b9eae7322a134abb6fce3c92c181bfb275ec5b3"
  end

  resource "xxhash" do
    url "https://files.pythonhosted.org/packages/ca/29/df598e738ff37558ac627264deb2e560902d9bf7f46d3bd5175c9eee593e/xxhash-3.8.1-cp314-cp314-macosx_11_0_arm64.whl"
    sha256 "af0c9fedc4a2c24e8664953882fe8185f3790b8338c9c700f76f5ad660817711"
  end

  resource "yarl" do
    url "https://files.pythonhosted.org/packages/61/02/962c1cbfc401a30c1d034dc67ff395f64b52302c6d62de556c1fca99acc0/yarl-1.24.5-py3-none-any.whl"
    sha256 "a33700d13d9b7d84fd10947b09ff69fb9a792e519c8cb9764a3ca70baa6c23a7"
  end

  def install
    # MinerU declares requires-python ">=3.10,<3.14", as does its own sibling
    # mineru-vl-utils. That cap is vestigial: it was added 2025-05-09 (PR #2449) after
    # PyMuPDF failed to build on a 3.14 *alpha*, and MinerU no longer depends on PyMuPDF
    # at all. Every dependency in the tree resolves and runs on 3.14/arm64. We ignore the
    # declaration rather than patching it -- mineru-vl-utils ships as a pure wheel whose
    # metadata a patch cannot reach, and a patch would break the build the day upstream
    # relaxes the cap, whereas this flag simply becomes a no-op.
    ENV["PIP_IGNORE_REQUIRES_PYTHON"] = "1"

    venv = virtualenv_create(libexec, "python3.14")
    venv.pip_install resources

    # torch, numpy and cv2 come from the pytorch/numpy/opencv formulae rather than PyPI
    # wheels: brewed pytorch is 2.13.0 (satisfies torch>=2.6,<3), numpy is 2.5.1, and
    # opencv is 5.0.0 (satisfies opencv-python>=4.11). Dropping torch and numpy alone
    # takes the venv from 1.5GB to 980MB. Verified that PyPI torchvision's compiled ops
    # (e.g. torchvision.ops.nms) dispatch correctly through brewed libtorch.
    #
    # opencv is the expensive one -- it pulls 105 recursive dependencies (Qt, VTK,
    # FFmpeg, OpenVINO, Tesseract, Boost, HDF5) to replace a self-contained 48MB wheel.
    # It is reused here as a deliberate choice because this tap's target machine already
    # carries most of that tree; if that stops being true, restore the opencv-python
    # wheel as a resource and drop the opencv dependency.
    site = libexec/"lib/python3.14/site-packages"
    (site/"homebrew-deps.pth").write <<~PTH
      #{formula_opt_libexec("pytorch")}/lib/python3.14/site-packages
      #{formula_opt_lib("numpy")}/python3.14/site-packages
      #{formula_opt_lib("opencv")}/python3.14/site-packages
    PTH

    system libexec/"bin/python", "-m", "pip", "install", "--no-deps", cached_download
    bin.install_symlink Dir[libexec/"bin/mineru*"]
  end

  def caveats
    <<~EOS
      MinerU downloads model weights on first parse (not on --version/--help),
      into the huggingface or modelscope cache, and writes ~/mineru.json. Choose
      a source with:

        export MINERU_MODEL_SOURCE=huggingface   # or: modelscope, local

      On Apple Silicon the MLX engine is selected automatically.

      Output is Markdown (with tables as embedded HTML) plus content_list.json
      and middle.json -- there is no direct HTML output. To produce HTML, render
      the Markdown, or generate from content_list.json for cleaner semantics.

      This formula runs MinerU on Python 3.14, which upstream does not yet
      support (their <3.14 cap predates the 3.14 release and is unrelated to any
      current dependency). Reproduce any bug on Python 3.13 before reporting it
      upstream.
    EOS
  end

  test do
    assert_match "3.4.4", shell_output("#{bin}/mineru --version")

    # The whole point of the formula is the heavy native stack, so prove it loads
    # rather than just checking the CLI entry point resolves.
    system libexec/"bin/python", "-W", "ignore", "-c", <<~PYTHON
      import os
      import torch, torchvision, numpy, onnxruntime, transformers, cv2, fasttext
      import mlx.core as mx, mlx_vlm, mineru, mineru_vl_utils

      # torch, numpy and cv2 must be the brewed ones, reached via homebrew-deps.pth --
      # i.e. resolved from the Cellar, not vendored into this formula's own venv.
      # __file__ reports the opt/ symlink path, so resolve it before comparing.
      for mod in (torch, numpy, cv2):
          path = os.path.realpath(mod.__file__)
          assert path.startswith("#{HOMEBREW_CELLAR}"), (mod.__name__, path)
      assert torch.__version__.startswith("2."), torch.__version__

      # torchvision's compiled extension links libtorch -- exercise a real op so an
      # ABI mismatch against brewed pytorch fails loudly here instead of at runtime.
      from torchvision.ops import nms
      boxes = torch.tensor([[0., 0., 10., 10.], [1., 1., 11., 11.]])
      assert nms(boxes, torch.tensor([0.9, 0.8]), 0.5).tolist() == [0]

      # fasttext-predict has no cp314 wheel and is built from source; make sure the
      # extension actually imports and runs.
      from fast_langdetect import detect
      assert detect("Bonjour, ceci est un document en francais.")["lang"] == "fr"
    PYTHON

    # MLX must be the engine actually chosen on Apple Silicon.
    output = shell_output("#{libexec}/bin/python -W ignore -c " \
                          "'from mineru.utils.engine_utils import _select_mac_engine; " \
                          "print(_select_mac_engine())'")
    assert_match "mlx", output
  end
end
