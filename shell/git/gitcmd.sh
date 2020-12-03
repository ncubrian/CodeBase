git difftool -t bc3 master dev main.c
git merge dev
git mergetool -t bc3 main.c

git clone -o remotename git://...
git branch --set-upstream-to=origin/dev
git clone https://github.com/toml-lang/toml.git --branch master --single-branch toml # 仅拉取master分支到本地toml目录中

git remote set-url origin git@github.com:foo/bar.git
git remote add foo git@github.com:Foo/bar.git
#git remote set-url foo git@github.com:Foo/bar.git

git pull foo develop
git push origin develop
git push origin --all # 把本地所有分支push到远程仓库，一一对应
git pull --all # 把远程仓库所有分支拉到本地，一一对应

git commit --amend
git push -f origin dev

git fetch foo
git checkout -t foo/master
git checkout -b newBrach origin/master

git branch -vv
git branch --set-upstream-to=origin/foobar # 修改当前分支追踪的远程仓库为origin仓库的foobar分支
git branch -m old_local_branch_name new_local_branch_name # 修改本地分支名
git ls-remote -h https://github.com/ncubrian/foobar.git |awk '{print substr($2, 12)}' # 列出远程仓库所有分支
git config --global core.quotepath false # 解决中文文件名称在git status命令输出中的显示问题

git push --tags origin master # push tags
git push origin :refs/tags/v0.9 #删除指定tag
git branch -d xxx #删除本地xxx分支

git reset --hard commit-hash # 回滚到之前某一commit
git merge --abort # 取消merge操作

git describe --contains --all HEAD|tr -s '\n'
git rev-parse --abbrev-ref HEAD # 获取当前分支
git rev-parse <tagname> # 获取指定tag对应的commit

使用Git比较本地分支版本和远程版本的不同之处
假定远端库名为 origin, 你要比较的本地分支为 foo, 远端分支为 xxx

# 获取远端库最新信息
$ git fetch origin

# commit visualization
git log --graph --decorate --oneline

# 做diff
$ git diff foo origin/xxx
git log dev..master # 查看master比dev多提交了什么
git diff dev master --stat # 查看dev和master分支之间改了哪些文件
git reset HEAD -- foo.bar # 恢复被暂存了的文件
git config --global core.excludesfile '~/.gitignore' #使全局gitignore生效
git config --global url."https://".insteadOf git://
git push origin --delete foobar # 删除远程分支
git push origin --delete tag foobar # 删除远程tag
git log --author="author name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -

----------------------------------------------------------------------------------------------------------
# Git 全局设置

git config --global user.name "foo"
git config --global user.email "foo@bar"

# 创建新版本库

git clone git@github.com:foo/aaa.git
cd aaa
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

# 已存在的文件夹

cd existing_folder
git init
git remote add origin git@github.com:foo/aaa.git
git add .
git commit
git push -u origin master

# 已存在的 Git 版本库

cd existing_repo
git remote add origin git@github.com:foo/aaa.git
git push -u origin --all
git push -u origin --tags
