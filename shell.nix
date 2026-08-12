{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [ deno ];

  # LC_ALL=en_US.UTF-8
  shellHook = ''clear; echo "Deno hazır."'';
}
