class Graphify < Formula
  include Language::Python::Virtualenv

  desc "Turn any folder of code or docs into a queryable knowledge graph"
  homepage "https://github.com/safishamsi/graphify"
  url "https://files.pythonhosted.org/packages/b6/35/fa72927545b34f3e978ad361dcc87043edd127b298861f0f6d54c753e3b5/graphifyy-0.8.44.tar.gz"
  sha256 "bd0bd48421ddab2db1fabc833e3f1f414cd5a85d0825f47274331a23ef4dcfca"
  license "MIT"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "maturin" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "python@3.13"

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/b9/8a/9afc7305a2ce4b52b30e137f83cd2a6a90b918b3997073db11bb5a1de55a/anthropic-0.111.0.tar.gz"
    sha256 "39cbda0ac17a6d423e5bf609811bd69b26eddf6299d7a468126e05bc711ce826"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/1c/b5/001890774a9552aff22502b8da382593109ce0c95314abaebbb116567545/anyio-4.14.0.tar.gz"
    sha256 "b47c1f9ccf73e67021df785332508f99379c68fa7d0684e8e3492cb1d4b23f89"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985/attrs-26.1.0.tar.gz"
    sha256 "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/c9/c7/424b75da314c1045981bd9777432fad05a9e0c69daa4ed7e308bbaffe405/certifi-2026.6.17.tar.gz"
    sha256 "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e7/a1/67fe25fac3c7642725500a3f6cfe5821ad557c3abb11c9d20d12c7008d3e/charset_normalizer-3.4.7.tar.gz"
    sha256 "ae89db9e5f98a11a4bf50407d4363e7b09b31e55bc117b4f7d80aab97ba009e5"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/9b/98/518d8e5081007684232226f475082b30087d0f585e8457db087298259f49/click-8.4.1.tar.gz"
    sha256 "918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/9b/22/adf66990e63584a68dfb50c24f48a125c07b1699899381c8151e63ed458c/cryptography-49.0.0-cp311-abi3-macosx_11_0_arm64.whl"
    sha256 "966fe0e9c67490071f14c0d2b1cb2dfb3023c5ce39457343931415f08382f2db"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3/distro-1.9.0.tar.gz"
    sha256 "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
  end

  resource "docstring-parser" do
    url "https://files.pythonhosted.org/packages/e0/4d/f332313098c1de1b2d2ff91cf2674415cc7cddab2ca1b01ae29774bd5fdf/docstring_parser-0.18.0.tar.gz"
    sha256 "292510982205c12b1248696f44959db3cdd1740237a968ea1e2e7a900eeb2015"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "httpx-sse" do
    url "https://files.pythonhosted.org/packages/0f/4c/751061ffa58615a32c31b2d82e8482be8dd4a89154f003147acee90f2be9/httpx_sse-0.4.3.tar.gz"
    sha256 "9b1ed0127459a66014aec3c56bebd93da3c1bc8bb6618c8082039a44889a755d"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/cd/63/9496c57188a2ee585e0f1db071d75089a11e98aa86eb99d9d7618fc1edce/idna-3.18.tar.gz"
    sha256 "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
  end

  resource "jiter" do
    url "https://files.pythonhosted.org/packages/66/b5/55f06bb281d92fb3cc86d14e1def2bd908bb77693183e7cb1f5a3c388b0c/jiter-0.15.0.tar.gz"
    sha256 "4251acc80e2b7c9b7b8823456ea0fceeb0734dac2df7636d3c711b38476b5a76"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/b3/fc/e067678238fa451312d4c62bf6e6cf5ec56375422aee02f9cb5f909b3047/jsonschema-4.26.0.tar.gz"
    sha256 "0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/19/74/a633ee74eb36c44aa6d1095e7cc5569bebf04342ee146178e2d36600708b/jsonschema_specifications-2025.9.1.tar.gz"
    sha256 "b540987f239e745613c7a9176f3edb72b832a4ac465cf02712288397832b5e8d"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/c1/ee/94c6c50ffc5b5cf4737052275d11b57367f32d1a8516e31dcd60591b3916/mcp-1.28.0.tar.gz"
    sha256 "559d3f9943674cafbe5744c5d3794f3237e8b47f9bbc58e20c0fad680d8487c2"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512/networkx-3.6.1.tar.gz"
    sha256 "26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/d0/ad/fed0499ce6a338d2a03ebae59cd15093910c8875328855781952abf6c2fe/numpy-2.4.6.tar.gz"
    sha256 "f3a3570c4a2a16746ac2c31a7c7c7b0c186b95ce902e33db6f28094ed7387dda"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/f3/fa/88d0c58a0c58df7e6758e66b99c5d028d5e0bb49f8812d7203940cd9dbf1/openai-2.43.0.tar.gz"
    sha256 "e74d238200a26868977002190fb6631613480a93dfe0c9c982e77021ed60a017"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/18/a5/b60d21ac674192f8ab0ba4e9fd860690f9b4a6e51ca5df118733b487d8d6/pydantic-2.13.4.tar.gz"
    sha256 "c40756b57adaa8b1efeeced5c196f3f3b7c435f90e84ea7f443901bec8099ef6"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/9d/56/921726b776ace8d8f5db44c4ef961006580d91dc52b803c489fafd1aa249/pydantic_core-2.46.4.tar.gz"
    sha256 "62f875393d7f270851f20523dd2e29f082bcc82292d66db2b64ea71f64b6e1c1"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/5c/b5/8f48e906c3e0205276e8bd8cb7512217a87b2685304d64be27cad5b3019f/pydantic_settings-2.14.2.tar.gz"
    sha256 "c19dd64b19097f1de80184f0cc7b0272a13ae6e170cbf240a3e27e381ed14a5f"
  end

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/3b/81/58d0ac84e1ef3a3843791d6954d94c0b33d526c75eeb1efbce9d0a4c4077/pyjwt-2.13.0.tar.gz"
    sha256 "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f637794879baf1b7703423"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/82/ed/0301aeeac3e5353ef3d94b6ec08bbcabd04a72018415dcb29e588514bba8/python_dotenv-1.2.2.tar.gz"
    sha256 "2c371a91fbd7ba082c2c1dc1f8bf89ca22564a087c2c287cd9b662adde799cf3"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/5b/42/55c32bb9b12693c092ad250a0e82edb5b31ddeda6eb772de5f308b3804ad/python_multipart-0.0.32.tar.gz"
    sha256 "be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e"
  end

  resource "rapidfuzz" do
    url "https://files.pythonhosted.org/packages/2c/21/ef6157213316e85790041254259907eb722e00b03480256c0545d98acd33/rapidfuzz-3.14.5.tar.gz"
    sha256 "ba10ac57884ce82112f7ed910b67e7fb6072d8ef2c06e30dc63c0f604a112e0e"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/22/f5/df4e9027acead3ecc63e50fe1e36aca1523e1719559c499951bb4b53188f/referencing-0.37.0.tar.gz"
    sha256 "44aefc3142c5b842538163acb373e24cce6632bd54bdb01b21ad5863489f50d8"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/dc/0e/49aee608ad09480e7fd276898c99ec6192985fa331abe4eb3a986094490b/regex-2026.5.9.tar.gz"
    sha256 "a8234aa23ec39894bfe4a3f1b85616a7032481964a13ac6fc9f10de4f6fca270"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/2e/43/25a8dcd3feedd735039a8f0b5b7e3b118232b5eae288c4fd9ab200d41094/rpds_py-2026.5.1.tar.gz"
    sha256 "07b24fea40541e28570e5b795a4a38fbdcd12550c06bd0748005ecc8116ca256"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/f7/2b/58abc2d1fd397e7dde08e947e05c884d8ef2f78d5e2588c17a12d42d6994/sse_starlette-3.4.4.tar.gz"
    sha256 "07e0fa0460138baf25cdd5fb28683472c3995dc1642225191b3832d62526bcb0"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/eb/e3/7c1dc7381d9f8ab7d854328ebfa884e62cb3f3d8549ddfd37c7814f42afa/starlette-1.3.1.tar.gz"
    sha256 "05d0213193f2fbaae60e2ecb593b4add4262ad4e46536b54abe36f11a71724e0"
  end

  resource "tiktoken" do
    url "https://files.pythonhosted.org/packages/e4/e5/5f3cb2159769d0f4324c0e9e87f9de3c4b1cd45848a96b2eb3566ad5ca77/tiktoken-0.13.0.tar.gz"
    sha256 "c9435714c3a84c2319499de9a300c0e604449dd0799ff246458b3bb6a7f433c1"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/87/d7/0535a28b1f5f24f6612fb3ff1e89fb1a8d160fee0f976e0aa6803862134b/tqdm-4.68.3.tar.gz"
    sha256 "00dfa48452b6b6cfae3dd9885636c23d3422d1ec97c66d96818cbd5e0821d482"
  end

  resource "tree-sitter" do
    url "https://files.pythonhosted.org/packages/4e/9c/a278b15e6b263e86c5e301c82a60923fa7c59d44f78d7a110a89a413e640/tree_sitter-0.25.2-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "f5ddcd3e291a749b62521f71fc953f66f5fd9743973fd6dd962b092773569601"
  end

  resource "tree-sitter-bash" do
    url "https://files.pythonhosted.org/packages/23/bb/2d2cfbb1f89aaeb1ec892624f069d92d058d06bb66f16b9ec9fb5873ab60/tree_sitter_bash-0.25.1-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "f4a34a6504c7c5b2a9b8c5c4065531dea19ca2c35026e706cf2eeeebe2c92512"
  end

  resource "tree-sitter-c" do
    url "https://files.pythonhosted.org/packages/c1/1c/1140db75e7e375cda3c68792a33826c4fd40b5b98c3259d93c75f6c8368f/tree_sitter_c-0.24.2-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "97bc80a224d48215d4e6e6376bf30d114f4c317b8145ff1b02afe785d4ba7bdd"
  end

  resource "tree-sitter-c-sharp" do
    url "https://files.pythonhosted.org/packages/c8/13/593c8603f834eaf15082b81e079289fc9f062b4c0ab5b9489134084eec06/tree_sitter_c_sharp-0.23.5-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "a75994a11f6fed3f5b8c36ad6a00e5dc43205bd912c43af3a2a54fdf649664eb"
  end

  resource "tree-sitter-cpp" do
    url "https://files.pythonhosted.org/packages/12/1c/0337c016bdc00a77a3326d12f10ee836401dd28f27db6fd5b7734bfb21ed/tree_sitter_cpp-0.23.4-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "bc3c404d9f0cbd87951213a85440afbf4c31e718f8d907fa9ee12bea4b8d276f"
  end

  resource "tree-sitter-elixir" do
    url "https://files.pythonhosted.org/packages/7e/d7/f0ad3de0b359a8a1f694268855bb34134c88774fa2276cb33413163c0403/tree_sitter_elixir-0.3.5-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "015f537731af690cfa238b0fb76a8af4f0d1a2c54a38563f159926d2967ce650"
  end

  resource "tree-sitter-fortran" do
    url "https://files.pythonhosted.org/packages/b2/83/c93d2959030ff858f97a5cebedd1281341c6d69d240bb616c6fa7fb86538/tree_sitter_fortran-0.6.0-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "a0fe5929fd91d245aba5a3b414399a296fb9924942a549190cee226e5b1ec96c"
  end

  resource "tree-sitter-go" do
    url "https://files.pythonhosted.org/packages/32/16/dd4cb124b35e99239ab3624225da07d4cb8da4d8564ed81d03fcb3a6ba9f/tree_sitter_go-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "503b81a2b4c31e302869a1de3a352ad0912ccab3df9ac9950197b0a9ceeabd8f"
  end

  resource "tree-sitter-groovy" do
    url "https://files.pythonhosted.org/packages/26/17/a1fbf1fb2b13a3bdb1bc5d57cde77aaaa64f005eb25cacff50bf21148719/tree_sitter_groovy-0.1.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "db35a5bdceb826382c7f52d33db0b2075217473f698daf77eb8d4e557a161d51"
  end

  resource "tree-sitter-hcl" do
    url "https://files.pythonhosted.org/packages/8e/8b/7618448cde58ca6fbefcf210ef98d7c4bd7d2b54b3e3d5cddd947c804a18/tree_sitter_hcl-1.2.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "03678762e8b78d717187848edebed95e4c31a54e14f24dec97555f47fb440e28"
  end

  resource "tree-sitter-java" do
    url "https://files.pythonhosted.org/packages/57/ef/6406b444e2a93bc72a04e802f4107e9ecf04b8de4a5528830726d210599c/tree_sitter_java-0.23.5-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "24acd59c4720dedad80d548fe4237e43ef2b7a4e94c8549b0ca6e4c4d7bf6e69"
  end

  resource "tree-sitter-javascript" do
    url "https://files.pythonhosted.org/packages/b1/8f/6b4b2bc90d8ab3955856ce852cc9d1e82c81d7ab9646385f0e75ffd5b5d3/tree_sitter_javascript-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "8264a996b8845cfce06965152a013b5d9cbb7d199bc3503e12b5682e62bb1de1"
  end

  resource "tree-sitter-json" do
    url "https://files.pythonhosted.org/packages/5c/31/102c15948d97b135611d6a995c97a3933c0e9745f25737723977f58e142c/tree_sitter_json-0.24.8-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "62b4c45b561db31436a81a3f037f71ec29049f4fc9bf5269b6ec3ebaaa35a1cd"
  end

  resource "tree-sitter-julia" do
    url "https://files.pythonhosted.org/packages/ef/d6/7049e567a9d3be58449717e7af22424ee22afa43667e8e309ec0a3603fea/tree_sitter_julia-0.23.1-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "8197c8d9b0cb51421aa2832f3fb539504d7b514cbb1fc79130bb1445c0b4a457"
  end

  resource "tree-sitter-kotlin" do
    url "https://files.pythonhosted.org/packages/7d/20/66105b6e94d062440955d374e64d030c3173cf4f592f6a6a3c426b3c94d0/tree_sitter_kotlin-1.1.0-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "910b41a580dae00d319e555075f3886a41386d1067931b14c7de504eeae3ae2a"
  end

  resource "tree-sitter-lua" do
    url "https://files.pythonhosted.org/packages/de/0c/6bc3228d01419e8b5af664bf328d174b02a64736ffa23a335c778c8cda68/tree_sitter_lua-0.5.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "c14714ad395c4166566f3e4dd0cc0979411684cbcd23702e3c631c3e6eae84fd"
  end

  resource "tree-sitter-objc" do
    url "https://files.pythonhosted.org/packages/32/11/051f22252ee02ac3d0ca00ebcd99476da586b5d916390dc2f251e610ca7c/tree_sitter_objc-3.0.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "9fa8b1221d2651a51cf42e1551c0804e9f48707da70f41f3195910c599b5522b"
  end

  resource "tree-sitter-php" do
    url "https://files.pythonhosted.org/packages/ab/5e/b52f2599acb29f6899470f7137d3d491c752b88df3950fb7408aea57ddca/tree_sitter_php-0.24.1-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "29759c67d4c27a68c227ed82c0b7e4699617b1bd23757d50c081f81a12b4f80d"
  end

  resource "tree-sitter-powershell" do
    url "https://files.pythonhosted.org/packages/7f/53/486a2495d336d4f67031d759590223e4121fcc7da79afe989f29a1157c2f/tree_sitter_powershell-0.26.4-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "b5dde429c9de55b75906e240d6db1cf85417e2fc0a56d7b321810c2cd4cf3f98"
  end

  resource "tree-sitter-python" do
    url "https://files.pythonhosted.org/packages/e6/1d/60d8c2a0cc63d6ec4ba4e99ce61b802d2e39ef9db799bdf2a8f932a6cd4b/tree_sitter_python-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "480c21dbd995b7fe44813e741d71fed10ba695e7caab627fb034e3828469d762"
  end

  resource "tree-sitter-ruby" do
    url "https://files.pythonhosted.org/packages/e7/38/c41ecf7692b8ecccd26861d3293a88150a4a52fc081abe60f837030d7315/tree_sitter_ruby-0.23.1-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "aa4ee7433bd42fac22e2dad4a3c0f332292ecf482e610316828c711a0bb7f794"
  end

  resource "tree-sitter-rust" do
    url "https://files.pythonhosted.org/packages/78/2a/cf39f881a545360b5a86bb1accba1f4acc713daab01fb9edd35b6e84f473/tree_sitter_rust-0.24.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "01a46622735498493f29f3e628a90de95c96a07bfbeb88996243eb986b1cee36"
  end

  resource "tree-sitter-scala" do
    url "https://files.pythonhosted.org/packages/cc/8a/87fbf40fc87bcb61c06860e95a75b425d5678eda786dea6ae46616e04f07/tree_sitter_scala-0.26.0-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "7829245c660902148d06e6c9e36255d60b0feb47974c87a1d09dd2cbdbba12c8"
  end

  resource "tree-sitter-sql" do
    url "https://files.pythonhosted.org/packages/05/45/b2bd5f9919ea15c4ae90a156999101ebd4caa4036babe54efaf9d3e77d55/tree_sitter_sql-0.3.11-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "a33cd6880ab2debef036f80365c32becb740ec79946805598488732b6c515fff"
  end

  resource "tree-sitter-swift" do
    url "https://files.pythonhosted.org/packages/5d/37/84e2bc7826eb9007c531f47e5557461c5a48fd14bd3ea82424afa3d06b5f/tree_sitter_swift-0.7.3-cp38-abi3-macosx_11_0_arm64.whl"
    sha256 "ee627e027d0868c552beca13dcdfa9944662b126f642464c5038ee3204e68340"
  end

  resource "tree-sitter-typescript" do
    url "https://files.pythonhosted.org/packages/8f/2f/1f36fda564518d84593f2740d5905ac127d590baf5c5753cef2a88a89c15/tree_sitter_typescript-0.23.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "c7cc1b0ff5d91bac863b0e38b1578d5505e718156c9db577c8baea2557f66de8"
  end

  resource "tree-sitter-verilog" do
    url "https://files.pythonhosted.org/packages/b5/bb/865ef41dafc4e94513f0f186360a840104d0ec6fde3d60d9b432a36dfb02/tree_sitter_verilog-1.0.3-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "5b9d70d86cf6913abc08766b6180e285d72848c7491a3f3f8e7bb8d8c440049d"
  end

  resource "tree-sitter-zig" do
    url "https://files.pythonhosted.org/packages/5a/78/93d32fea98b3b031bc0fbec44e27f2b8cc1a1a8ff5a99dfb1a8f85b11d43/tree_sitter_zig-1.1.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "daa2cdd7c1a2d278f2a917c85993adb6e84d37778bfc350ee9e342872e7f8be2"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655/typing_inspection-0.4.2.tar.gz"
    sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953/urllib3-2.7.0.tar.gz"
    sha256 "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/c4/1f/fa18009dea8469069cca78a4e877a008ab78f08b064bfc9ab891579077ff/uvicorn-0.49.0.tar.gz"
    sha256 "ebf4271aa580d9de97f93192d4595176df6e91f9aae919ca73e4fc07df1e66a3"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")

    wheels, sdists = resources.partition { |r| r.url.end_with?(".whl") }
    venv.pip_install sdists
    wheels.each do |r|
      r.stage do
        system libexec/"bin/python", "-m", "pip", "install", "--no-deps",
               "--no-index", "--no-build-isolation", Dir["*.whl"].first
      end
    end

    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      graphify bundles every language grammar, the MCP server (graphify-mcp),
      and the Anthropic/OpenAI providers. Optional backends are NOT bundled:
      Neo4j, FalkorDB, Postgres, video/PDF/Office ingestion, and Leiden
      clustering. To get those, install graphify's extras with pipx or uv,
      which can layer them into an isolated tool environment:

        uv tool install 'graphifyy[all]'
        pipx install 'graphifyy[neo4j,video]'

      After upgrading, reinstall the graphify skill into any agents so the
      bundled skill matches the new version (otherwise graphify warns that
      the skill is from an older release):

        graphify install
    EOS
  end

  test do
    (testpath/"hello.py").write <<~PY
      def greet(name):
          return f"hi {name}"
    PY
    system bin/"graphify", "update", testpath
    assert_path_exists testpath/"graphify-out/graph.json"
    assert_match version.to_s, shell_output("#{bin}/graphify --version")
  end
end
