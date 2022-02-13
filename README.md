<p align="center">
[dotbare](https://github.com/kazhala/dotbare) plugin for <a href="https://github.com/xxh/xxh-shell-bash">xxh-shell-bash</a>.
</p>

## Requirements

Prior to using this plugin, you should already be using [the excellent dotbare](https://github.com/kazhala/dotbare) and have your dotfiles under version control.

To configure you must define your github repo hosting your dotfiles (not the actual `dotbare` repo).  Export that in your [~/.config/xxh/config.xxhc] like this:


```yaml
hosts:
  ".*":                       # for all hosts
    +e:                       # simple environment variables
      - DOTBARE_REPO="drmikecrowe/baredotfiles"
```

## Note!
The plugin copy files only once during first start. It copies the files from plugin home directory to the host xxh home directory
as addition and without replacing. It means if you hadn't the directory it will appear. If you have directory with files
but without the file from plugin home it just appears.

Be carefully if you are using [non-hermetic environment](https://github.com/xxh/xxh/wiki#how-to-set-homeuser-as-home-on-host) by using `+hhh '~' +hhx '~'` arguments.

## Install
From xxh repo:
```bash
xxh +I https://github.com/drmikecrowe/xxh-plugin-prerun-dotbare
```
Connect:
```
xxh yourhost +if
```
