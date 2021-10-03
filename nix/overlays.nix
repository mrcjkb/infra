let
  nix-community-infra = pkgs: rec {
    inherit (pkgs)
      git-crypt
      niv
      sops
      morph
      sources;

    terraform = pkgs.terraform_1_0.withPlugins (
      p: [
        p.cloudflare
        p.null
        p.external
      ]
    );
  };

in
[
  (self: super: { sources = import ./sources.nix; })
  (self: super: {
    nix-community-infra = nix-community-infra super;
  })
]
