# Repository Overview: NixOS Configuration

This repository manages a declarative NixOS system configuration, primarily targeting a WSL environment, using Nix flakes. It defines the system's software, services, and user environment.

## Essential Commands

*   **Apply System Configuration**: Apply the defined NixOS configuration to the system.
    ```bash
    nixos-rebuild switch --flake .#wsl
    ```
*   **Check Flake for Errors**: Validate the flake's syntax and dependency references without applying.
    ```bash
    nix flake check
    ```
*   **Enter Development Shell**: Provide a shell with development tools and environment defined in the flake. (Note: A `devShell` is not explicitly defined in `flake.nix`, but this is a standard flake command for development workflows).
    ```bash
    nix develop
    ```
*   **Update Flake Inputs**: Update all external flake inputs (dependencies) to their latest versions.
    ```bash
    nix flake update
    ```

## Code Organization and Structure

*   **`flake.nix`**: The entry point for the Nix flake. It defines:
    *   `inputs`: External dependencies like `nixpkgs` (Nix Packages collection) and `nixvim` (Nix module for Neovim configuration).
    *   `outputs`: Defines `nixosConfigurations`, specifically for a system named `"wsl"`.
*   **`configuration.nix`**: Contains the core NixOS system configuration for the `wsl` host. This includes:
    *   Importing NixOS-WSL specific modules.
    *   Global Nix settings (e.g., enabling `nix-command` and `flakes` experimental features).
    *   Declarative installation of system-wide packages (`environment.systemPackages`).
    *   Configuration for various programs like `git`, `tmux`, and `nixvim`, including extensive Neovim plugin and option setups.
*   **`home/default.nix`**: (Currently empty) This file is typically used for [Home Manager](https://nix-community.github.io/home-manager/) configurations, allowing for declarative management of user-specific packages and dotfiles. If user-specific configurations are needed, they would be added here.
*   **`hosts/`**: This directory is present, suggesting it's intended for additional host-specific configurations if the setup were to manage multiple machines. Its current contents were not reviewed.

## Naming Conventions and Style Patterns

*   **Nix Language**: Adheres to standard Nix language syntax and conventions.
*   **Functional Style**: Configurations are written in a functional style, common in Nix, where options are defined as attribute sets.
*   **Arguments**: Functions often accept `pkgs` (for accessing packages from `nixpkgs`) and `inputs` (for accessing other flake inputs) as arguments.
*   **CamelCase**: NixOS options generally follow a camelCase naming convention (e.g., `environment.systemPackages`, `programs.nixvim`).

## Testing Approach and Patterns

*   **`nix flake check`**: The primary method for validating the configuration's syntax and ensuring all references in the flake are resolvable. This provides an initial check for correctness.
*   **System Activation**: The ultimate "test" involves applying the configuration using `nixos-rebuild switch`. This deploys the changes to the system, and operational verification then confirms functionality.

## Important Gotchas or Non-Obvious Patterns

*   **Nix Flakes Paradigm**: This repository fully embraces Nix flakes, meaning all dependencies are hermetically managed and version-locked in `flake.lock`. Direct changes to system-wide packages or configurations outside the Nix system are generally discouraged as they can be overwritten upon next rebuild.
*   **NixOS-WSL Specifics**: The configuration includes modules and settings specific to running NixOS within the Windows Subsystem for Linux. Agents should be aware of potential differences compared to native NixOS installations.
*   **Declarative vs. Imperative**: NixOS is a declarative operating system. Agents should always modify the Nix configuration files and rebuild the system, rather than making imperative changes directly on the system.
*   **`system.stateVersion`**: The `system.stateVersion` option in `configuration.nix` is critical. It dictates how NixOS handles migrations of stateful data across different NixOS releases. Changing this value without thoroughly understanding its implications can lead to data loss or system instability. It should be treated with extreme caution.
*   **Nixvim Integration**: The `nixvim` module provides a comprehensive and declarative way to configure Neovim and its plugins. Any Neovim-related changes should be made within the `programs.nixvim` section of `configuration.nix` to ensure reproducibility.
