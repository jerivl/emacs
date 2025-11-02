{ pkgs, lib, config, inputs, ... }:

{
  env.GREET = "devenv";

  packages = [ pkgs.entr pkgs.bash ];

  scripts = {
    add-config.exec = ''
      echo ./config.org | entr bash -c "sleep 1 && git add config.org"
    '';

  
    hello.exec = ''
      echo ------------------------
      echo hello from $GREET
      echo run \'add-config\' to automatically stage any changes made to config.org
      echo ------------------------
    '';
  };

  cachix.enable = false; 
  
  # https://devenv.sh/basics/
  enterShell = ''
    hello         # Run scripts directly
  '';
}
