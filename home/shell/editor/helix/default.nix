{ lib
, ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = lib.mkForce true;
    settings = {
      editor = {
        auto-format = true;
        auto-info = true;
        auto-save = true;
        bufferline = "multiple";
        line-number = "relative";
        mouse = false;
        lsp.display-inlay-hints = true;
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "error";
          other-lines = "error";
        };

      };
    };

    languages = {
      language-server = {
        nil.config = { autoarchive = true; };
      };
      language =
        let
          mk-lang = name: language-servers: extra: { inherit name; language-servers = language-servers; } // extra;
        in
        [ (mk-lang "nix" [ "nil" ] { }) ];
    };
  };
}
