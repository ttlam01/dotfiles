# dotfiles

Follow instruction here: https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
and here: https://medium.com/@augusteo/simplest-way-to-sync-dotfiles-and-config-using-git-14051af8703a

When setting up new machine, run

git clone --bare git@github.com:ttlam01/dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout HEAD
