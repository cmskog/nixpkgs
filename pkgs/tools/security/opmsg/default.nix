{ stdenv, openssl, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "opmsg-${version}";
  version = "1.78";

  src = fetchFromGitHub {
    owner = "stealth";
    repo = "opmsg";
    rev = "rel-${version}s";
    sha256 = "1px5csfva33rz15bvlx1w59sazx6rl8v9773s9df3j5pqqmimdqj";
  };

  makeFlags = [ "-C src" ];

  buildInputs = [ openssl ];

  installPhase = ''
    mkdir -p $out/bin
    cp src/opmsg $out/bin
  '';

  meta = with stdenv.lib; {
    description = "A gpg alternative";
    longDescription = ''
      opmsg is a replacement for gpg which can encrypt/sign/verify your
      mails or create/verify detached signatures of local files.
    '';
    homepage = https://github.com/stealth/opmsg;
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.cmskog ];
    platforms = [ "x86_64-linux" ];
  };
}
