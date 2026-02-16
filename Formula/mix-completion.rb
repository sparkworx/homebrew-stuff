class MixCompletion < Formula
  desc "Elixir Mix shell completion"
  homepage "https://github.com/sparkworx/mix-completion"
  url "https://github.com/sparkworx/mix-completion/archive/refs/tags/0.9.0.tar.gz"
  sha256 "628a8c62648d48741f4d020157ff09d894fd5a3f71e40effb226ee5182538cba"
  head "https://github.com/sparkworx/mix-completion.git", branch: "master"

  # bottle :unneeded

  # disable! date: "2024-08-10", because: :no_license

  depends_on "elixir"

  def install
    bash_completion.install "mix"
  end

  test do
    assert_match "-F _mix",
      shell_output("bash -c 'source #{bash_completion}/mix && complete -p mix'")
  end
end
