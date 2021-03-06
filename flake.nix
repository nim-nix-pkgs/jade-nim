{
  description = ''Compiles jade templates to Nim procedures.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."jade-nim-master".dir   = "master";
  inputs."jade-nim-master".owner = "nim-nix-pkgs";
  inputs."jade-nim-master".ref   = "master";
  inputs."jade-nim-master".repo  = "jade-nim";
  inputs."jade-nim-master".type  = "github";
  inputs."jade-nim-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jade-nim-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}