Heavily based on https://github.com/jamescherti/minimal-emacs.d

This is a declarative configuration based on elpaca. I was previously using nix to accomplish with its wide abundance of tooling for managing both my external dependencies and emacs dotfiles. However, I ran into a few issues that pushed me to managing these two systems separately:
1. Every persistent change that I wanted to include in my emacs configuration required a rebuild of my system. This got tedious as my nix configs have become complex enough where rebuilds could take hours if I need to recompile any other software.
2. The nix package manager didn't always play nicely with use-package based configurations. This made installing and configuring packages unpredictably difficult as emacs often needed to be pointed to a nix-based source. emacsWithPackagesFromUsePackage from the [overlay](https://github.com/nix-community/emacs-overlay) only made this marginally better.
3. Nix was a little bit overkill given that I was already managing my configuration declaritively with native emacs tooling. I also noticed that I was often only using a small subset of the packages I had configured on any given project. 

This repo is structured such that I can reduce the bloat of my configuration while still maintaining its flexibility by enabling modules of elisp code to be configured as add ons to a solid base.
