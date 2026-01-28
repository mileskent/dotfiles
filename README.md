# My Dotfiles
## Usage
Make sure that you have [GNU stow](https://command-not-found.com/stow)

Clone this repo and run stow. This works on clean machines, with no config collisions.
```
git clone https://github.com/mileskent/dotfiles.git && \
  cd dotfiles && \
  stow . --verbose=2
```

If there is a config collision run the following. This brings all the conflicting files into the repo's directory before symlinking.
```
stow . --adopt --verbose=2
```

If you wish to overwrite local configs, just reset the repo after adopting the local configs.
```
git reset --hard HEAD
```
