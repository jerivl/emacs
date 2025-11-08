{ pkgs, lib, config, inputs, ... }:

{
  env.GREET = "devenv";

  packages = [ pkgs.entr pkgs.bash ];

  scripts = {

    hello.exec = ''
      echo ------------------------
      echo hello from $GREET
      echo ------------------------
      echo "Automatically staging all changes to config.org"
    '';
  };

  processes.add-config = {
    # I added this since I'm mainly only editing one file
    exec = ''
     echo ./config.org | entr bash -c "sleep 1 && git add config.org"
    '';
    cwd = "${config.git.root}";
  };

  cachix.enable = false;

  # https://devenv.sh/basics/
  enterShell = ''
   hello         # Run scripts directly
  '';
}
