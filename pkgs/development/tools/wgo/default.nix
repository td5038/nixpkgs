{ lib
, buildGoModule
, fetchFromGitHub
}:

let
  pname = "wgo";
  version = "0.5.4";
in
buildGoModule {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "bokwoon95";
    repo = "wgo";
    rev = "v${version}";
    hash = "sha256-MPmB6G5JCIEfFYchVmV8sS5Zfzfui9tClDI6RlLdP6U=";
  };

  vendorHash = "sha256-w6UJxZToHbbQmuXkyqFzyssFcE+7uVNqOuIF/XKdEsU=";

  ldflags = [ "-s" "-w" ];

  subPackages = [ "." ];

  meta = with lib; {
    description = "Live reload for Go apps";
    homepage = "https://github.com/bokwoon95/wgo";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
