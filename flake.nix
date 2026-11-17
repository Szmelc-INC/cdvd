{
  description = "Eyecandy screensaver: DVD logo bounce in the terminal, written in C";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: rec {
        cdvd = pkgs.stdenv.mkDerivation {
          pname = "cdvd";
          version = "0-unstable-${self.shortRev or self.dirtyShortRev or "dirty"}";
          src = ./.;
          nativeBuildInputs = [ pkgs.gcc ];
          makeFlags = [ "DESTDIR=$(out)" "BINDIR=/bin" "PREFIX=/" ];
          installPhase = ''
            runHook preInstall
            make DESTDIR=$out BINDIR=/bin install
            install -Dm644 LICENSE $out/share/licenses/cdvd/LICENSE
            runHook postInstall
          '';
          meta = {
            description = "Eyecandy screensaver: DVD logo bounce in the terminal";
            homepage = "https://github.com/Szmelc-INC/cdvd";
            license = pkgs.lib.licenses.gpl3Only;
            mainProgram = "cdvd";
            platforms = pkgs.lib.platforms.linux;
          };
        };
        default = cdvd;
      });

      apps = forAllSystems (pkgs: {
        default = {
          type = "app";
          program = "${self.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/cdvd";
        };
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell { packages = with pkgs; [ gcc ]; };
      });
    };
}
