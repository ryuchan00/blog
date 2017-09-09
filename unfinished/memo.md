# untraceファイル(add前、新しく作ったファイル)に対しての削除方法

```
git clean -f
```

# gitの名前の設定

```
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```

# Herokuのbuildpacの扱い

## 現在使用中のbuildpackを表示する

```
heroku buildpacs
1. https://github.com/heroku/heroku-buildpack-apt
2. https://github.com/rcaught/heroku-buildpack-cmake
3. heroku/ruby
```

## buildpacをセットする

```
heroku buildpacks:set "ビルドパック名またはURL"
# ex.
heroku buildpacks:set heroku/ruby # rubyのbuildpack
heroku buildpacks:set https://github.com/heroku/heroku-buildpack-apt # build時にapt-getしてくれるbuildpack
```

## buildpack を追加する

```
heroku buildpacks:add "ビルドパック名またはURL"
# ex.
heroku buildpacks:add --index 1 heroku/nodejs # indexオプションは、buildpackが複数ある時の実行順の指定。
```

## 全てのbuildpackを削除する

```
heroku buildpacks:clear
```

https://codon-buildpacks.s3.amazonaws.com/buildpacks/frederick/heroku-buildpack-ruby.tgz

# ipアドレスの確認

```sh
ifconfig
```

# bashの最初の呪文

2種類の shebang

シェルスクリプトの一行目に必ず記述する #! で始まる行を shebang と言います。
bash スクリプトの shebang は、bash を絶対パスで指定する方法と、env を使って指定する方法の二種類あります。


bash を絶対パスを指定する方法
#!/bin/bash
env を使ってを指定する方法
#!/usr/bin/env bash
前者は /bin/bash が使われます。
（/bin/bash が存在しなければスクリプトの起動時にエラーとなります）

後者は $PATH 上の bash が使われます。
（通常、bash は一か所にしか無いので、後者でも /bin/bash となる可能性が高いです。）

後者のメリットは、例えば $HOME/.opt 配下に最新の bash をインストールするなどした場合、$PATH にさえ入っていればそっちが使われるというのがあります。
