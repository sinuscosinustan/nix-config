{ config, lib, pkgs, ... }:

{
  home-manager.users.sinuscosinustan = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.4.0";
            sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
          };
        }
      ];

      localVariables = {
        "FZF_COMPLETION_TRIGGER" = "**";
      };

      sessionVariables = {
        "HISTSIZE" = "10000000";
        "EDITOR"   = "vim";
      };

      shellAliases = {
        "vi" = "vim";
        "gpm" = "git push -o merge_request.create -o -u origin $(git rev-parse --abbrev-ref HEAD)";
      };

      initExtra = "
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$(hostname).sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ssh-agent -a \"$SSH_AUTH_SOCK\" >/dev/null
fi
      ";

      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "git"
          "fzf"
        ];
      };
    };
  };
}
