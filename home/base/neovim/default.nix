{ pkgs, lib, config,... }: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

  };

  home.packages = with pkgs; [
    #-- python
    nodePackages.pyright
    python312Packages.flake8

    #-- nix
    nil

    #-- bash
    nodePackages.bash-language-server
    shellcheck
    shfmt

    #-- lua
    stylua
    lua-language-server

    #-- javascript/typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    nodePackages.eslint

    nodePackages.yaml-language-server
    nodePackages.prettier
    marksman
    # glow
    nodePackages.dockerfile-language-server-nodejs
    tree-sitter

    ripgrep
    gdu
    bottom
  ];

  home.activation.installAstroNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./nvim}/ ${config.xdg.configHome}/nvim/
  '';
}
