git difftool -t bc3 master dev main.c
git merge dev
git mergetool -t bc3 main.c

git clone -o remotename git://...
git branch --set-upstream-to=origin/dev

git remote set-url origin git@github.com:foo/bar.git
git remote add foo git@github.com:Foo/bar.git
#git remote set-url foo git@github.com:Foo/bar.git

git pull foo develop
git push origin develop

git commit --amend
git push -f origin dev

git fetch foo
git checkout -t foo/master
git checkout -b newBrach origin/master

git branch -vv
git branch --set-upstream-to=origin/foobar # 修改当前分支追踪的远程仓库为origin仓库的foobar分支

git push origin :refs/tags/v0.9 #删除指定tag
git branch -d xxx #删除本地xxx分支

使用Git比较本地分支版本和远程版本的不同之处
假定远端库名为 origin, 你要比较的本地分支为 foo, 远端分支为 xxx
# 获取远端库最新信息
$ git fetch origin
# 做diff
$ git diff foo origin/xxx
git log dev..master # 查看master比dev多提交了什么
git diff dev master --stat # 查看dev和master分支之间改了哪些文件
git reset HEAD -- foo.bar # 恢复被暂存了的文件
git config --global core.excludesfile '~/.gitignore' #使全局gitignore生效
