class Graphify < Formula
  include Language::Python::Virtualenv

  desc "Turn any folder of code or docs into a queryable knowledge graph"
  homepage "https://github.com/safishamsi/graphify"
  url "https://files.pythonhosted.org/packages/f3/77/bf633118d831c191c9d267ece1f087acdfaafb3b9dd61187985f3d002347/graphifyy-0.9.6.tar.gz"
  sha256 "3716d5abac6c18dd3e7cec4306c8b497892ebac36baefd86c40d25eced471a19"
  license "MIT"

  livecheck do
    url :stable
    strategy :pypi
  end

  depends_on "cmake" => :build
  depends_on "maturin" => :build
  depends_on "ninja" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"
  depends_on "python@3.14"

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/66/a2/d31f14e28d49bae983a3634e38dfb4b31c50110b5e403596c5c6a20b23f8/anthropic-0.116.0.tar.gz"
    sha256 "5fc248fbb9fe03ef686f8a774f81586bca31a043260aab88b387ea3660f4a396"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/3b/72/5562aabb8dd7181e8e860622a38bea08d17842b99ecd4c91f84ac95251b0/anyio-4.14.1.tar.gz"
    sha256 "8d648a3544c1a700e3ff78615cd679e4c5c3f149904287e73687b2596963629e"
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
    url "https://files.pythonhosted.org/packages/76/d4/81420972a676e8ffea40450d8c8c92943e7218a78fe9b64359836cc9876b/click-8.4.2.tar.gz"
    sha256 "9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6"
  end

  # cryptography: source on macOS, prebuilt manylinux wheel on Linux.
  #   macOS - upstream ships NO macOS x86_64 wheel for 49.0.0, so building the sdist
  #     against openssl@3 is the only way to cover Intel Macs (arm64 builds fine too).
  #   Linux - the sdist's cffi codegen step (build_openssl.py, run by the venv python
  #     during the Rust build) fails under Homebrew's bubblewrap build sandbox; upstream
  #     publishes manylinux abi3 wheels, so use those. manylinux2014 (glibc 2.17) is
  #     chosen for the broadest Linuxbrew compatibility.
  resource "cryptography" do
    on_macos do
      url "https://files.pythonhosted.org/packages/1f/99/d1c90d6041656cc6ee229dc99cd67fd0cd5aec3c5f7d72fffc27cc750054/cryptography-49.0.0.tar.gz"
      sha256 "f89660a348f4f78a92366240a61404e337586ef7f5909a2fef59ca88ef505493"
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/09/41/3797cfaf69cae04a13ee78ebd83f0678d9c02b4779d21ce24445326f1a69/cryptography-49.0.0-cp311-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.whl"
        sha256 "36d1709f992593689b45bda411498d62c6e365f2ca00b84657d4dadd24de16db"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/e6/8b/43011f7ebe515a8aa20d61f290a326cd890c2e738e16e59eaff8d9c3a412/cryptography-49.0.0-cp311-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.whl"
        sha256 "0e959b578856a3924bc0cbb710fc12c387b9412a951389f3ca61704a9e25f325"
      end
    end
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
    url "https://files.pythonhosted.org/packages/1d/1f/10936e16d8860c70698a1aa939a46aa0224813b782bce4e000e637da0b2d/jiter-0.16.0.tar.gz"
    sha256 "7b24c3492c5f4f84a37946ad9cf504910cf6a782d6a4e0689b6673c5894b4a1c"
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
    url "https://files.pythonhosted.org/packages/6e/77/9450b8f251a13affb6281997d0523c4615f8a8b35d0b21ff30db3a5aac9d/mcp-1.28.1.tar.gz"
    sha256 "d51e36a5f5644faea4f85ea649bfffa6bc6c26770d42798ad6a3de3d2ba69683"
  end

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512/networkx-3.6.1.tar.gz"
    sha256 "26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/22/fd/89965aa4ac08c74998539fcbf24fa3540f3e15237fbeb6bcf9c908f4aade/numpy-2.5.1.tar.gz"
    sha256 "a48a113e6afea91f5608793bafa7ef2ad481fefbda87ec5069f483de61cb9fa3"
  end

  resource "openai" do
    url "https://files.pythonhosted.org/packages/49/f5/7c7cb955305cb41f7f3c5fd7e0e38bf6bbf2658468863d4b7b868a5cb8df/openai-2.44.0.tar.gz"
    sha256 "68a5a5ffad82b8ff7d451c437529fb64f7c3b8123aaf0c021966a882d9e3947d"
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
    url "https://files.pythonhosted.org/packages/f1/05/e4f219230e11e774a6c9987d2ab0d0c6b8573e13a17e143d0015bee710ef/regex-2026.6.28.tar.gz"
    sha256 "3cb4b6c5cb3060cc31efdc1fbb27c25fb9b29044afd87e40601a1c4d9db54342"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/aa/2a/9618a122aeb2a169a28b03889a2995fe297588964333d4a7d67bdf46e147/rpds_py-2026.6.3.tar.gz"
    sha256 "1cebd1337c242e4ec2293e541f712b2da849b29f48f0c293684b71c0632625d4"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/d2/1b/bc9e3e7a72dcdad7dc7888758f5d00f56f8909ed5cfdff822bd72bb4c520/sse_starlette-3.4.5.tar.gz"
    sha256 "83072538bc211a2f68b7b0422226c4af3e9b62e106e07034664b832ca019842a"
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

  # tree-sitter core: source build. Upstream publishes only cp313 (non-abi3)
  # wheels for this version, which would re-lock graphify to one CPython and break
  # on the next Homebrew Python bump. Building the (complete) sdist from source is
  # the only way to stay Python-version-independent. Small, portable C build.
  resource "tree-sitter" do
    url "https://files.pythonhosted.org/packages/66/7c/0350cfc47faadc0d3cf7d8237a4e34032b3014ddf4a12ded9933e1648b55/tree-sitter-0.25.2.tar.gz"
    sha256 "fe43c158555da46723b28b52e058ad444195afd1db3ca7720c59a254544e9c20"
  end

  # tree-sitter grammars: upstream-recommended abi3 wheels, selected per platform.
  # The maintainers ship and recommend wheels; the sdists are not meant for
  # standalone compilation (most omit the parser headers and/or external-scanner
  # source). abi3 => no CPython-version lock (no time bomb), and the nested
  # on_macos/on_linux + on_arm/on_intel selection covers macOS arm64/x86_64 and
  # Linux aarch64/x86_64. One uniform mechanism: version bumps only refresh hashes.
  resource "tree-sitter-bash" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/23/bb/2d2cfbb1f89aaeb1ec892624f069d92d058d06bb66f16b9ec9fb5873ab60/tree_sitter_bash-0.25.1-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "f4a34a6504c7c5b2a9b8c5c4065531dea19ca2c35026e706cf2eeeebe2c92512"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/30/8e/37e7364d9c9c58da89e05c510671d8c45818afd7b31c6939ab72f8dc6c04/tree_sitter_bash-0.25.1-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "0e6235f59e366d220dde7d830196bed597d01e853e44d8ccd1a82c5dd2500acf"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/25/f0/1bb25519be27460255d3899db677313cfa1e6306988fbf456a3d7e211bbb/tree_sitter_bash-0.25.1-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "e76c4cfb20b076552406782b7f8c2a3946835993df0a44df006de54b7030c7dc"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/d7/22/9f70bc3d3b942ab9fc0f89c1dc9e087519a3a94f64ae6b7377aae3a7a0f0/tree_sitter_bash-0.25.1-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
        sha256 "3f484c4bb8796cde7a87ca351e6116f09653edac0eb3c6d238566359dd28b117"
      end
    end
  end

  resource "tree-sitter-c" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/c1/1c/1140db75e7e375cda3c68792a33826c4fd40b5b98c3259d93c75f6c8368f/tree_sitter_c-0.24.2-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "97bc80a224d48215d4e6e6376bf30d114f4c317b8145ff1b02afe785d4ba7bdd"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/28/c1/26ed17730ec2c17bedc1b673349e5e0a466c578e3eb0327c3b73cf52bf97/tree_sitter_c-0.24.2-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "4d4579a8b54f0a442f903d88d3304cab77cd5c2031d4015baa4f2f8e15d6dcb7"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/87/78/47dc570e7aee6b0a1ecc2520b30639cc2b06003154c9ab0672d86bf720d5/tree_sitter_c-0.24.2-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "c098bedcd5ac86ff93fa734d51d1dd86aed40fd5ed7d634c7af11380a0469969"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/e9/8c/0dfb88d726f8821d1c4c36042f092be974a800afd734307a595b8604190c/tree_sitter_c-0.24.2-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "5041ef67eb68ce6bc8bb0b1f8ef3a5585ce523dae0c7eec109ab0627dd75aede"
      end
    end
  end

  resource "tree-sitter-c-sharp" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/c8/13/593c8603f834eaf15082b81e079289fc9f062b4c0ab5b9489134084eec06/tree_sitter_c_sharp-0.23.5-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "a75994a11f6fed3f5b8c36ad6a00e5dc43205bd912c43af3a2a54fdf649664eb"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/ec/c4/86d8d469400a856757a464a6ac01af97d8cdacbb595e62bdb98bf1e9db90/tree_sitter_c_sharp-0.23.5-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "61e1981cf21b09ee547b9c4c68e64fb4394325f8fc8d5f6d50d41471eba923ea"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/0a/c8/e0f391e343f5424d0627e3b6886c77baeb1249a3f10986be00b0b64ecdab/tree_sitter_c_sharp-0.23.5-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "3ea38fb095d85d360dc5a0bec2fa605e496228876f798c9e089d5f0e72bcef46"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/41/5a/a8855cbb5bbab28adb29c2c7f0e7be5a9f1d21450c13b3c3e613190d9b8c/tree_sitter_c_sharp-0.23.5-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "aa88a780204cd153c4c1ae2d59c654cee1402212fa0d069823d6d34301587438"
      end
    end
  end

  resource "tree-sitter-cpp" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/12/1c/0337c016bdc00a77a3326d12f10ee836401dd28f27db6fd5b7734bfb21ed/tree_sitter_cpp-0.23.4-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "bc3c404d9f0cbd87951213a85440afbf4c31e718f8d907fa9ee12bea4b8d276f"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/b6/ac/11d56670f7b048362db872ca866fd00ba2002a322ab179f047b7c0fb2910/tree_sitter_cpp-0.23.4-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "aacb1759f0efd9dbc25bd8ee88184a340483018869f75412d9c3bc32c039a520"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/b3/7b/dd38c049b10ed7fda118b903a1d28a8b55a36b98c30606ef90e8f374c6de/tree_sitter_cpp-0.23.4-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "ccc43ddf1279d5d5a4ef190373f4cb16522801bec4492bcd4754edf2aeba2b7b"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/6a/4d/23e390234d2acd351f5563b1079c515d7c1fe13ddb7392cee543be74dda3/tree_sitter_cpp-0.23.4-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "773d2cafc08bbc0f998687fa33f42f378c1a371cdb582870c4d13abb06092706"
      end
    end
  end

  resource "tree-sitter-elixir" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/7e/d7/f0ad3de0b359a8a1f694268855bb34134c88774fa2276cb33413163c0403/tree_sitter_elixir-0.3.5-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "015f537731af690cfa238b0fb76a8af4f0d1a2c54a38563f159926d2967ce650"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/2f/29/c2c2b028c49f3c08270dd01ee72a9e735d59c59499d0b7ed09f45157f6b8/tree_sitter_elixir-0.3.5-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "514078a2f68d27da9a1e6b6e9601b8456faba6260ecfa252e898a848c4f8584d"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/3c/50/69ed38e335d1228f6eb1c12707269fefb349710aaf0b6d4a730ea88b95c2/tree_sitter_elixir-0.3.5-cp39-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "d1159057f914d4468fc53cb9d7e8369f8a7826e1d07765bb53fbf391e6058863"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/31/35/78c94e164542ad08098b83cb7e046261f3ab2edade96e29727dd209bfa35/tree_sitter_elixir-0.3.5-cp39-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "ebfe3491a3d00ac50b12a3bfcabb1c564f3809ed8a095099fe87f49d6b3987e6"
      end
    end
  end

  resource "tree-sitter-fortran" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/b2/83/c93d2959030ff858f97a5cebedd1281341c6d69d240bb616c6fa7fb86538/tree_sitter_fortran-0.6.0-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "a0fe5929fd91d245aba5a3b414399a296fb9924942a549190cee226e5b1ec96c"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/be/c8/dcf0b1e49b6af4d31a4555748626b02b21f3c93f1725a9ecab9d11a44511/tree_sitter_fortran-0.6.0-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "b6495c4c25cf68785ffd30e615b5481219415761ca66dde14a9577d03075714d"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/90/35/60be7b22889a5b59142c91b4067c709f18fcca745adcb4b570261d755570/tree_sitter_fortran-0.6.0-cp39-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "1fd7b179305db93ffe8435ee42f6895e76677744721707b3f2f328a92dd4f61e"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/57/86/0923f061e36f229d99660a8f53f8e3b57da459e08512c09e256de820c472/tree_sitter_fortran-0.6.0-cp39-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
        sha256 "ac4800b4abc1b25e6e7ab4a3f2eae274c5b19107beb18d3a473c0f67509c7486"
      end
    end
  end

  resource "tree-sitter-go" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/32/16/dd4cb124b35e99239ab3624225da07d4cb8da4d8564ed81d03fcb3a6ba9f/tree_sitter_go-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "503b81a2b4c31e302869a1de3a352ad0912ccab3df9ac9950197b0a9ceeabd8f"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/ca/aa/0984707acc2b9bb461fe4a41e7e0fc5b2b1e245c32820f0c83b3c602957c/tree_sitter_go-0.25.0-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "b852993063a3429a443e7bd0aa376dd7dd329d595819fabf56ac4cf9d7257b54"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/26/21/d3d88a30ad007419b2c97b3baeeef7431407faf9f686195b6f1cad0aedf9/tree_sitter_go-0.25.0-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "148255aca2f54b90d48c48a9dbb4c7faad6cad310a980b2c5a5a9822057ed145"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/86/fb/b30d63a08044115d8b8bd196c6c2ab4325fb8db5757249a4ef0563966e2e/tree_sitter_go-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "04b3b3cb4aff18e74e28d49b716c6f24cb71ddfdd66768987e26e4d0fa812f74"
      end
    end
  end

  resource "tree-sitter-groovy" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/26/17/a1fbf1fb2b13a3bdb1bc5d57cde77aaaa64f005eb25cacff50bf21148719/tree_sitter_groovy-0.1.2-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "db35a5bdceb826382c7f52d33db0b2075217473f698daf77eb8d4e557a161d51"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/ca/69/c911eea5fb8cdd042b81d050a86440fd9704a497e7e5d841efb88f8184bd/tree_sitter_groovy-0.1.2-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "27adb7a4077511782dbd94a12f4635dfb52ccb88f734fe1569393e2d28b18bbd"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/7c/06/784b2c394605291c6a46405ac3152a76cced2ce1b11ee9702cc7a34db84d/tree_sitter_groovy-0.1.2-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "4cdb4c62284f19fbfdd4900e816c3e8604672de107e4e52a8e65b663f368b4cb"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/c6/b7/451ac5e158f2418fea7eb0744254dd27238359c070420d69d711aaf06356/tree_sitter_groovy-0.1.2-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "9e938e9c2cd5fdb08fd1b28d7d621d15ea959a17a4bc0b77833e07a94fe7d263"
      end
    end
  end

  resource "tree-sitter-hcl" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/8e/8b/7618448cde58ca6fbefcf210ef98d7c4bd7d2b54b3e3d5cddd947c804a18/tree_sitter_hcl-1.2.0-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "03678762e8b78d717187848edebed95e4c31a54e14f24dec97555f47fb440e28"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/77/34/7ccb58107ae0d38e0a8f05dedbd990780eb7d429f227725c15fee314cdcd/tree_sitter_hcl-1.2.0-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "9ae35084a3dc12272f941b424eadd8a44cf2e0e9345b020330cf8db6f67d3524"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/12/35/b8f87fffb5527c85f5f292486e53f64963846b94cf3ea258f4b850480f18/tree_sitter_hcl-1.2.0-cp310-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "d2e9f3cfb6694e33f5b880e74bed842398cbacd21024251e2ec90f19dee6a64d"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/ee/0a/01bb627044d273e8e506edff8ab773e562ba447b5790b789f62e47a5e754/tree_sitter_hcl-1.2.0-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "915763da6630610c2efb7afe13145f50feb8043732a74f9bae78811212578d3d"
      end
    end
  end

  resource "tree-sitter-java" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/57/ef/6406b444e2a93bc72a04e802f4107e9ecf04b8de4a5528830726d210599c/tree_sitter_java-0.23.5-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "24acd59c4720dedad80d548fe4237e43ef2b7a4e94c8549b0ca6e4c4d7bf6e69"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/67/21/b3399780b440e1567a11d384d0ebb1aea9b642d0d98becf30fa55c0e3a3b/tree_sitter_java-0.23.5-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "355ce0308672d6f7013ec913dee4a0613666f4cda9044a7824240d17f38209df"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/4e/6c/74b1c150d4f69c291ab0b78d5dd1b59712559bbe7e7daf6d8466d483463f/tree_sitter_java-0.23.5-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "9401e7271f0b333df39fc8a8336a0caf1b891d9a2b89ddee99fae66b794fc5b7"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/29/09/e0d08f5c212062fd046db35c1015a2621c2631bc8b4aae5740d7adb276ad/tree_sitter_java-0.23.5-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "370b204b9500b847f6d0c5ad584045831cee69e9a3e4d878535d39e4a7e4c4f1"
      end
    end
  end

  resource "tree-sitter-javascript" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/b1/8f/6b4b2bc90d8ab3955856ce852cc9d1e82c81d7ab9646385f0e75ffd5b5d3/tree_sitter_javascript-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "8264a996b8845cfce06965152a013b5d9cbb7d199bc3503e12b5682e62bb1de1"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/2c/df/5106ac250cd03661ebc3cc75da6b3d9f6800a3606393a0122eca58038104/tree_sitter_javascript-0.25.0-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "b70f887fb269d6e58c349d683f59fa647140c410cfe2bee44a883b20ec92e3dc"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/96/c8/97da3af4796495e46421e9344738addb3602fa6426ea695be3fcbadbee37/tree_sitter_javascript-0.25.0-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "199d09985190852e0912da2b8d26c932159be314bc04952cf917ed0e4c633e6b"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/5f/c4/7da74ecdcd8a398f88bd003a87c65403b5fe0e958cdd43fbd5fd4a398fcf/tree_sitter_javascript-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "9dc04ba91fc8583344e57c1f1ed5b2c97ecaaf47480011b92fbeab8dda96db75"
      end
    end
  end

  resource "tree-sitter-json" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/5c/31/102c15948d97b135611d6a995c97a3933c0e9745f25737723977f58e142c/tree_sitter_json-0.24.8-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "62b4c45b561db31436a81a3f037f71ec29049f4fc9bf5269b6ec3ebaaa35a1cd"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/42/41/84866232980fb3cf0cff46f5af2dbb9bfa3324b32614c6a9af3d08926b72/tree_sitter_json-0.24.8-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "59ac06c6db1877d0e2076bce54a5fddcdd2fc38ca778905662e80fa9ffcea2ab"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/28/64/aa44ea2f3d2e76ec086ce83902eb26b2ed0a92d3fd5e2714c9cb007e90d1/tree_sitter_json-0.24.8-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "f8627f7d375fda9fc193ebee368c453f374f65c2f25c58b6fea4e6b49a7fccbc"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/77/08/10001992526670e0d6f24c571b179f0ece90e5e014a4b98a3ce076884f32/tree_sitter_json-0.24.8-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "85cca779872f7278f3a74eb38533d34b9c4de4fd548615e3361fa64fe350ad0a"
      end
    end
  end

  resource "tree-sitter-julia" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/ef/d6/7049e567a9d3be58449717e7af22424ee22afa43667e8e309ec0a3603fea/tree_sitter_julia-0.23.1-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "8197c8d9b0cb51421aa2832f3fb539504d7b514cbb1fc79130bb1445c0b4a457"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/75/31/4acc0236ea2abefc24a963e37ddd3fd097e4074dea86ae9227c4f98bb85a/tree_sitter_julia-0.23.1-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "4bd4d8e76ab780a2de9af90cefada494cb174991d74993b6a243f28081e9432b"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/e9/a0/ec24b30029e736a0418124777c53b0723329d9cdc4be4cbf60f46dfc7ea6/tree_sitter_julia-0.23.1-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "7708a4a01831dd7cb7e6ee25146e654a0bf89077e85ffe8b5025b63a302af145"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/0b/4c/09534d31ab95c3da2284f538bb134bf6fe064770c0bf6fe4fb6f2b028d9e/tree_sitter_julia-0.23.1-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "7d4f6ae938198fc0be9b6ea76313ade24fcdb89be01a791e0cc90c88fae5743d"
      end
    end
  end

  resource "tree-sitter-kotlin" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/7d/20/66105b6e94d062440955d374e64d030c3173cf4f592f6a6a3c426b3c94d0/tree_sitter_kotlin-1.1.0-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "910b41a580dae00d319e555075f3886a41386d1067931b14c7de504eeae3ae2a"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/2c/a5/ce5a2ba7b97db8d90c89516674f5c46e2d41503e00dd743ba7aad4661097/tree_sitter_kotlin-1.1.0-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "6cca5ef06d090e8494ac1d9f0aac71ed32207d412766b5df7da00d94334181a2"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/f7/4c/e1ef38fe412fa9851403fc75a653f2b69bbe1e11e2e7faf219631ebe7e4a/tree_sitter_kotlin-1.1.0-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "906e5444ebb01db439cb3ad65913598a4ea957b0e068aa973265926a17eb00e0"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/65/bd/0f3aac45eb88b6b3173ac9c23bc41d8865943cbbe1caaafc001cd1b73c90/tree_sitter_kotlin-1.1.0-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "9a92afe24b634cf914c5812af0f5c53184b1c18bdf6ee5505c83afac81f6bf6c"
      end
    end
  end

  resource "tree-sitter-lua" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/de/0c/6bc3228d01419e8b5af664bf328d174b02a64736ffa23a335c778c8cda68/tree_sitter_lua-0.5.0-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "c14714ad395c4166566f3e4dd0cc0979411684cbcd23702e3c631c3e6eae84fd"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/b0/b2/d1ffd919692b217d257222cbfa1705268dfea073b91ffb81726da0e27fe8/tree_sitter_lua-0.5.0-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "cc4f2eb734dc9223bf96c0eeffa78a9485db207d00841e27e52c8b036f2164f7"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/bf/7f/53bbfde347e5d9a34e0a9ed367d340dd876cf987c6ce8478c0597e1cf608/tree_sitter_lua-0.5.0-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "b02f057a997e618c5b1b03a5cef9dd6c2673043d396ca86edba372728f17ef53"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/45/2b/1edfd9bef9a1cc11047cd87ca9c60707b8425080cfc0498a7d3bc762d783/tree_sitter_lua-0.5.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "5ec448c854fea32414a0449147d648bc5baddf7a0357008c4abe3269db35370a"
      end
    end
  end

  resource "tree-sitter-objc" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/32/11/051f22252ee02ac3d0ca00ebcd99476da586b5d916390dc2f251e610ca7c/tree_sitter_objc-3.0.2-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "9fa8b1221d2651a51cf42e1551c0804e9f48707da70f41f3195910c599b5522b"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/f4/c9/39436200acd5db5c229845857eda011a102fd01d0fdb5fee82961842d558/tree_sitter_objc-3.0.2-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "bd25b3c4ca99263c0898aa7a362a1b8d9bb642692ae9ddd357755586019b1544"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/bd/d8/fa3808fad119b0d4ba47453ad69c7520649ddc7d0716c087443c1aa4a03c/tree_sitter_objc-3.0.2-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "30b6f9cd49593bac50161a6de6e1b8d591b318d64b33b8bde5385faa05461084"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/60/cd/a153a4268b9b405a69ee3e427f19fc570a3c63d4b4d7766bee5a7ba28744/tree_sitter_objc-3.0.2-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "e71282ac9c096a966bf2fa6a4ecdbea4bd037d3e01ea4aa9bbc64d9a4c0022f6"
      end
    end
  end

  resource "tree-sitter-php" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/ab/5e/b52f2599acb29f6899470f7137d3d491c752b88df3950fb7408aea57ddca/tree_sitter_php-0.24.1-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "29759c67d4c27a68c227ed82c0b7e4699617b1bd23757d50c081f81a12b4f80d"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/a4/c8/1a499038cb4036bea1d560ffbc807a6fb940261aa22296bd49a62ed8bcba/tree_sitter_php-0.24.1-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "d56e2dcf025450f84a2cdbf4b18a09e6cb88b92e9e6858e63de3d4133ab2e43e"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/6b/58/ca290da45380bd6ba7c6b0b98cc5fc30325c32c7f14f0c93196a451b19c4/tree_sitter_php-0.24.1-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "94b89832ac09f078eed2acd88598838bc51012224cbcebb916dbb6a37e74357e"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/9a/c6/fd863a7a779d0ab67688939eba0e08bff7b1ffe731288d3d3610df21217b/tree_sitter_php-0.24.1-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
        sha256 "7a1404a30f2972498ace040b0029738b8dac45d0a12932ccb8b605eb94bafbe4"
      end
    end
  end

  resource "tree-sitter-powershell" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/7f/53/486a2495d336d4f67031d759590223e4121fcc7da79afe989f29a1157c2f/tree_sitter_powershell-0.26.4-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "b5dde429c9de55b75906e240d6db1cf85417e2fc0a56d7b321810c2cd4cf3f98"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/34/c9/7871fad7f9e01f4ece4f30260e4fba25da0608cf4ad14e02ca103f2c1a67/tree_sitter_powershell-0.26.4-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "0bf8beac7ed4501d1c52456f8ae9728ab2a5a079325548b06b1bc9746655524e"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/03/bd/9701b14ea2f1d26e299ff1108df99c34cecf1d221f04de9076db24590dec/tree_sitter_powershell-0.26.4-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "c0989b221ce6cc1dfe3bc9993d3ca1ee96f3ca62173423b9a332a61c5afa3c12"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/de/ff/5bba5fef4b3808ade114512ebf44e0c192050cc825cdcf42fa2043e5abd0/tree_sitter_powershell-0.26.4-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "56508e4ac7aad1e3b26f2ef96b8d2b60b149c4efa0c23742e91e809a11db73ee"
      end
    end
  end

  resource "tree-sitter-python" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/e6/1d/60d8c2a0cc63d6ec4ba4e99ce61b802d2e39ef9db799bdf2a8f932a6cd4b/tree_sitter_python-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "480c21dbd995b7fe44813e741d71fed10ba695e7caab627fb034e3828469d762"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/cf/64/a4e503c78a4eb3ac46d8e72a29c1b1237fa85238d8e972b063e0751f5a94/tree_sitter_python-0.25.0-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "14a79a47ddef72f987d5a2c122d148a812169d7484ff5c75a3db9609d419f361"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/40/bd/bf4787f57e6b2860f3f1c8c62f045b39fb32d6bac4b53d7a9e66de968440/tree_sitter_python-0.25.0-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "be71650ca2b93b6e9649e5d65c6811aad87a7614c8c1003246b303f6b150f61b"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/aa/cb/d9b0b67d037922d60cbe0359e0c86457c2da721bc714381a63e2c8e35eba/tree_sitter_python-0.25.0-cp310-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "86f118e5eecad616ecdb81d171a36dde9bef5a0b21ed71ea9c3e390813c3baf5"
      end
    end
  end

  resource "tree-sitter-ruby" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/e7/38/c41ecf7692b8ecccd26861d3293a88150a4a52fc081abe60f837030d7315/tree_sitter_ruby-0.23.1-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "aa4ee7433bd42fac22e2dad4a3c0f332292ecf482e610316828c711a0bb7f794"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/23/2e/2717b9451c712b60f833827a696baf29d8e50a0f7dccbf22a8d7006cc19e/tree_sitter_ruby-0.23.1-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "39f391322d2210843f07081182dbf00f8f69cfbfa4687b9575cac6d324bae443"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/d8/01/14ef2d5107e6f42b64a400c3bbc3dd3b8fd24c3cef5306004ae03668f231/tree_sitter_ruby-0.23.1-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "62b36813a56006b7569db7868f6b762caa3f4e419bd0f8cf9ccbb4abb1b6254c"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/23/dd/1171b5dd25da10f768732a20fb62d2e3ae66e3b42329351f2ce5bf723abb/tree_sitter_ruby-0.23.1-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "f7bcd93972b4ca2803856d4fe0fbd04123ff29c4592bbb9f12a27528bd252341"
      end
    end
  end

  resource "tree-sitter-rust" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/78/2a/cf39f881a545360b5a86bb1accba1f4acc713daab01fb9edd35b6e84f473/tree_sitter_rust-0.24.2-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "01a46622735498493f29f3e628a90de95c96a07bfbeb88996243eb986b1cee36"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/d0/24/2b2d33af5e27c84a4fde4e8cd2594bb4ab1e1cf48756a9f40dadc84956cc/tree_sitter_rust-0.24.2-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "3620cfd12340efa43082d45df76349ff511893a9c361da2f8d6d51e307020a59"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/b5/f6/a5a146df5c0a5daea3ffcd5d7245775fe7f084357770d5a313dd6245ae78/tree_sitter_rust-0.24.2-cp39-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "9d76d1208c3638b871236090759dfc13d478921320653a6c9da5336e7c58f65a"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/ca/45/a051bbd3045a61182dde25b93ae9a33d2677c935b16952283e12eaf46051/tree_sitter_rust-0.24.2-cp39-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "e033c5a93b57c88e0a835880de39fc802909ff69f57aaff6000211c196ea5190"
      end
    end
  end

  resource "tree-sitter-scala" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/cc/8a/87fbf40fc87bcb61c06860e95a75b425d5678eda786dea6ae46616e04f07/tree_sitter_scala-0.26.0-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "7829245c660902148d06e6c9e36255d60b0feb47974c87a1d09dd2cbdbba12c8"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/32/d6/4b53e2c29a1278327bbd52f84fce3a10553989db46d257686f06906b237d/tree_sitter_scala-0.26.0-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "80a6cf19d923dacb54621422fd806ea52b9f103ead41a279fc2278f91a488395"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/ab/cd/439f7e6ef3a918503bc0b0d810bb066c0a67c914c5adb22e38d3194dfd4d/tree_sitter_scala-0.26.0-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "17ec7e63b7b486a71b3799c665801a9bdfcf69417b86119ceb22630e43136082"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/3f/61/e64e1c2b2552f5dc556c9710ecf935ed531efa8a3eb9de9ad4e7c95f6e97/tree_sitter_scala-0.26.0-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "cff178a9310d859e819a6fe10f312b6e423d9a1d0cca5e6354a45fe0041677be"
      end
    end
  end

  resource "tree-sitter-sql" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/05/45/b2bd5f9919ea15c4ae90a156999101ebd4caa4036babe54efaf9d3e77d55/tree_sitter_sql-0.3.11-cp310-abi3-macosx_11_0_arm64.whl"
        sha256 "a33cd6880ab2debef036f80365c32becb740ec79946805598488732b6c515fff"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/32/68/bb80073915dfe1b38935451bc0d65528666c126b2d5878e7140ef9bf9f8a/tree_sitter_sql-0.3.11-cp310-abi3-macosx_10_9_x86_64.whl"
        sha256 "cf1b0c401756940bf47544ad7c4cc97373fc0dac118f821820953e7015a115e3"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/8e/96/7cee5661aa897e5d1a67499944ea5cf8a148953c1dc07a3059a50db8cb56/tree_sitter_sql-0.3.11-cp310-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "344e99b59c8c8d72f7154041e9d054400f4a3fccc16c2c96ac106dde0e7f8d0c"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/1d/c1/eec7c09a9c94436ea4c56d096feba815e42b209b3d41a17532f99ecf0c67/tree_sitter_sql-0.3.11-cp310-abi3-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl"
        sha256 "5128b12f71ac0f5ebcc607f67a62cdc56a187c1a5ba7553feeb9c5f6f9bc3c72"
      end
    end
  end

  resource "tree-sitter-swift" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/5d/37/84e2bc7826eb9007c531f47e5557461c5a48fd14bd3ea82424afa3d06b5f/tree_sitter_swift-0.7.3-cp38-abi3-macosx_11_0_arm64.whl"
        sha256 "ee627e027d0868c552beca13dcdfa9944662b126f642464c5038ee3204e68340"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/9a/9d/df190b08548dcfa67790d3197442989b3dd5e46d31ee61a1b9ecea35d57b/tree_sitter_swift-0.7.3-cp38-abi3-macosx_10_9_x86_64.whl"
        sha256 "2531ec866c22ea52384e2786e07f3b2bb396c6446428a2df02cc74af3f7e6b6a"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/ff/38/0b7c4d195d03396c19a7968a13342c89cb8322d97c4882bb7c4240adf419/tree_sitter_swift-0.7.3-cp38-abi3-manylinux2014_aarch64.manylinux_2_17_aarch64.manylinux_2_28_aarch64.whl"
        sha256 "eee02fecb60a07267edd123148c583d6ec9efc5d7fcb25e53da4e56869fd4cf3"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/e1/9a/55f6cc9aad9079facf166d616472fd8e05007cbee9c62b749e153bf0521d/tree_sitter_swift-0.7.3-cp38-abi3-manylinux1_x86_64.manylinux_2_28_x86_64.manylinux_2_5_x86_64.whl"
        sha256 "f38feeb4f7350c8b30d567a0dc08bf1eeaa67c241b6888d72a45a8b1a4aa7187"
      end
    end
  end

  resource "tree-sitter-typescript" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/8f/2f/1f36fda564518d84593f2740d5905ac127d590baf5c5753cef2a88a89c15/tree_sitter_typescript-0.23.2-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "c7cc1b0ff5d91bac863b0e38b1578d5505e718156c9db577c8baea2557f66de8"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/28/95/4c00680866280e008e81dd621fd4d3f54aa3dad1b76b857a19da1b2cc426/tree_sitter_typescript-0.23.2-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "3cd752d70d8e5371fdac6a9a4df9d8924b63b6998d268586f7d374c9fba2a478"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/96/2d/975c2dad292aa9994f982eb0b69cc6fda0223e4b6c4ea714550477d8ec3a/tree_sitter_typescript-0.23.2-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "4b1eed5b0b3a8134e86126b00b743d667ec27c63fc9de1b7bb23168803879e31"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/49/d1/a71c36da6e2b8a4ed5e2970819b86ef13ba77ac40d9e333cb17df6a2c5db/tree_sitter_typescript-0.23.2-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "e96d36b85bcacdeb8ff5c2618d75593ef12ebaf1b4eace3477e2bdb2abb1752c"
      end
    end
  end

  resource "tree-sitter-verilog" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/b5/bb/865ef41dafc4e94513f0f186360a840104d0ec6fde3d60d9b432a36dfb02/tree_sitter_verilog-1.0.3-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "5b9d70d86cf6913abc08766b6180e285d72848c7491a3f3f8e7bb8d8c440049d"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/8d/e4/fddf086af55a425bbda76f1fa52b3daf3140af15542ab6d1fab821c41ad7/tree_sitter_verilog-1.0.3-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "ee20fe0e21c93bf1a10e20c13cbca959eb3c9693194afb90b0567758cbf1744e"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/38/3e/b59fe590400af935d42c81cd03d3e9669a9e3a4c305a89e8e491b46a9a0f/tree_sitter_verilog-1.0.3-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "7d617dff782a8bf56fabac8d1e782ee4ca9ebe2977682eb02d1596ff7ef89958"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/2a/c1/8782535dbb6ea1f3556eb2bc473f5f131339739278775171fc42b0a57536/tree_sitter_verilog-1.0.3-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "747dd7d4bc95fb389bc37225f82d16f0c40549856e9a244be3ff9d7bfe62b730"
      end
    end
  end

  resource "tree-sitter-zig" do
    on_macos do
      on_arm do
        url "https://files.pythonhosted.org/packages/5a/78/93d32fea98b3b031bc0fbec44e27f2b8cc1a1a8ff5a99dfb1a8f85b11d43/tree_sitter_zig-1.1.2-cp39-abi3-macosx_11_0_arm64.whl"
        sha256 "daa2cdd7c1a2d278f2a917c85993adb6e84d37778bfc350ee9e342872e7f8be2"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/b3/c6/db41d3f6c7c0174db56d9122a2a4d8b345c377ca87268e76557b2879675e/tree_sitter_zig-1.1.2-cp39-abi3-macosx_10_9_x86_64.whl"
        sha256 "e7542354a5edba377b5692b2add4f346501306d455e192974b7e76bf1a61a282"
      end
    end
    on_linux do
      on_arm do
        url "https://files.pythonhosted.org/packages/40/45/ef5afd6b79bd58731dae2cf61ff7960dd616737397db4d2e926457ff24b7/tree_sitter_zig-1.1.2-cp39-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl"
        sha256 "1962e95067ac5ee784daddd573f828ef32f15e9c871967df6833d3d389113eae"
      end
      on_intel do
        url "https://files.pythonhosted.org/packages/78/02/275523eb05108d83e154f52c7255763bac8b588ae14163563e19479322a7/tree_sitter_zig-1.1.2-cp39-abi3-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
        sha256 "e924509dcac5a6054da357e3d6bcf37ea82984ee1d2a376569753d32f61ea8bb"
      end
    end
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6/typing_extensions-4.16.0.tar.gz"
    sha256 "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5"
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
    url "https://files.pythonhosted.org/packages/2e/41/06cce5dbb9f77591512957710ac709e60b12e6216a2f2d0d607fd49706e8/uvicorn-0.50.0.tar.gz"
    sha256 "0c92e1bc2259cb7faa4fcef774a5966588f2e88542744550b66799fba10b76f1"
  end

  def install
    # Isolated venv: no system-site-packages. Every runtime dependency is
    # vendored as a resource, and pip's build isolation supplies the build
    # backends (setuptools/maturin/etc.), so the leak isn't needed and removing
    # it keeps graphify from importing unrelated Homebrew-installed packages.
    venv = virtualenv_create(libexec, "python3.14", system_site_packages: false)

    # cryptography's Rust (openssl-sys) build links against Homebrew openssl@3;
    # point it there explicitly and forbid the vendored-OpenSSL fallback.
    ENV["OPENSSL_DIR"] = formula_opt_prefix("openssl@3")
    ENV["OPENSSL_NO_VENDOR"] = "1"

    # Source resources (sdists) are compiled from source by virtualenv's pip_install.
    # The wheel-vendored grammars can't go through pip_install (its std_pip_args force
    # --no-binary=:all:, which rejects wheels), so install each staged, platform-selected
    # wheel directly. Drive pip from the Homebrew python interpreter (the venv is built
    # without pip and, with system_site_packages disabled, can't borrow the system one),
    # targeting the venv via --python.
    brew_python = formula_opt_bin("python@3.14")/"python3.14"
    wheels, sdists = resources.partition { |r| r.url.end_with?(".whl") }

    # On macOS, cryptography is built from source and its Rust build runs
    # build_openssl.py with the venv interpreter, which must be able to import cffi at
    # that point. Install cffi (and its pycparser dep) into the venv first so the build
    # never races the cffi resource. (On Linux cryptography is a prebuilt wheel, so this
    # is just harmless ordering.)
    bootstrap, rest = sdists.partition { |r| ["cffi", "pycparser"].include?(r.name) }
    venv.pip_install bootstrap
    venv.pip_install rest
    wheels.each do |r|
      r.stage do
        system brew_python, "-m", "pip", "--python=#{libexec}/bin/python", "install",
               "--no-deps", "--no-index", "--no-build-isolation", Dir["*.whl"].first
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
    python = libexec/"bin/python"

    # Key non-grammar modules must import (native-built crypto + tree-sitter core).
    system python, "-c", <<~PYTHON
      import cryptography, tree_sitter, pydantic, networkx, anthropic, openai, mcp
      assert cryptography.__version__
    PYTHON

    # Import EVERY bundled grammar: importing the package runs `from ._binding
    # import language`, which dlopens the compiled .so -- so this catches any
    # grammar whose native build is incomplete (e.g. a missing external scanner
    # would surface here as an unresolved-symbol ImportError), whether it was
    # built from source or vendored as a wheel.
    grammars = %w[
      bash c c_sharp cpp elixir fortran go groovy hcl java javascript json
      julia kotlin lua objc php powershell python ruby rust scala sql swift
      typescript verilog zig
    ]
    system python, "-c", <<~PYTHON
      import importlib
      for name in "#{grammars.join(" ")}".split():
          importlib.import_module("tree_sitter_" + name)
      print("imported", len("#{grammars.join(" ")}".split()), "grammars")
    PYTHON

    # Exercise grammars end-to-end so a broken parser table is caught too: build a
    # real parser from two representative grammars and confirm a clean (error-free)
    # tree. swift carries an external scanner; php is the grammar with no sdist at all.
    system python, "-c", <<~PYTHON
      from tree_sitter import Language, Parser
      import tree_sitter_swift, tree_sitter_php

      sw = Parser(Language(tree_sitter_swift.language()))
      tree = sw.parse(b"func greet(name: String) -> String { return \\"hi\\" }")
      assert not tree.root_node.has_error, "swift grammar produced parse errors"

      php = Parser(Language(tree_sitter_php.language_php()))
      tree = php.parse(b"<?php function greet($name) { return \\"hi $name\\"; }")
      assert not tree.root_node.has_error, "php grammar produced parse errors"
    PYTHON

    # Drive the CLI over a small repo: this runs the real ingestion pipeline and
    # writes the knowledge graph, exercising tree-sitter through graphify itself.
    (testpath/"hello.py").write <<~PY
      def greet(name):
          return f"hi {name}"
    PY
    system bin/"graphify", "update", testpath
    assert_path_exists testpath/"graphify-out/graph.json"
    assert_match version.to_s, shell_output("#{bin}/graphify --version")
  end
end
