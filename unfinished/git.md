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
