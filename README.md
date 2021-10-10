# Godot's Dotfiles

Every developer deserves a dotfiles repo. This is mine.

## About

I used to maintain dotfiles in a simple yet primitive way, which is to stash all the configurations with Git and update them occasionally.

As files are getting larger and larger, one day I decided to upgrade a bit. Firstly I searched out of some really great resources:

- [GitHub dotfiles](https://dotfiles.github.io/)
- [Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
- [YADR](https://github.com/skwp/dotfiles)

After some exploring, I decided to follow the method of [holman does dotfiles](https://github.com/holman/dotfiles). While instead of forking and customizing, I went with the approach of restructure my dotfiles repo, since there're many delicate stuff in it that's too much (and may not be suitable) for me during this time period.

## Description

For now there aren't a lot of components, just as the followings:

- `zsh/`: p10k, fzf and tilix should be foldered out, in the future
- `tmux/`
- `nvim/`
- `scripts/`
- `arch/`: still working in progress

If you want to try my dotfiles out, please make sure you've read them out (at least the setup script) and all the dependencies should be installed properly prior to usage.

## Roadmap

- [ ] Configurations for Git
- [ ] Useful `bins`
- [ ] Tools like [dotbot](https://github.com/anishathalye/dotbot)
- [ ] Installation and deployment via Ansible

## Contributing

Thanks for the inspiration of [holman does dotfiles](https://github.com/holman/dotfiles). If you have any questions or suggestions for this repo, please [open an issue](https://github.com/iamgodot/dotfiles/issues) for discussions, I really appreciate it.
