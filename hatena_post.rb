#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'dotenv'
Dotenv.load ".env"
require 'hatenablog'

file = File.open("./config.yml", "w")
file.write "consumer_key: " + ENV['CONSUMER_KEY'] + "\n"
file.write "consumer_secret: " + ENV['CONSUMER_SECRET'] + "\n"
file.write "access_token: " + ENV['ACCESS_TOKEN'] + "\n"
file.write "access_token_secret: " + ENV['ACCESS_TOKEN_SECRET'] + "\n"
file.write "user_id: " + ENV['USER_ID'] + "\n"
file.write "blog_id: " + ENV['BLOG_ID'] + "\n"
file.close

files = ""

File.open(ARGV[0]) do |file|
  # まずIO#readでファイル全体を文字列として読み込む
  # 次にString#splitで改行文字ごとに配列に変換
  # 最後にArray#eachで要素ごとにブロックを評価
  #
  # IO#read
  # 第1引数: 読み込むサイズ(デフォルト => nil)
  # 第2引数: 出力用のバッファ(デフォルト => '')
  # 読み込み用にオープンされていない場合にIOErrorが発生
  # データの読み込みに失敗した場合にErrno::EXXXが発生
  # file.read.split("\n").each do |labmen|
    # puts labmen
  # end
  files = file.read
end

# files.gsub!(/(\n)/, '  ')

# p files

# exit

# デフォルトでは 'conf.yml' から OAuth 設定を読み込む
Hatenablog::Client.create do |blog|
  # 最新 7 件のエントリの内容を出力する
  blog.entries.each do |entry|
    # puts entry.content
  end

  # 新しいエントリを投稿する
  posted_entry = blog.post_entry('Test Entry Title',
                                #  '# This is entry contents\n test', # Markdown 形式
                                files,
                                 ['Test', 'Programming'])  # カテゴリ

  # 既存エントリを更新する
  # updated_entry = blog.update_entry(posted_entry.id,
                                    # 'Revised Entry Title',
                                    # posted_entry.content,
                                    # posted_entry.categories)

  # 既存エントリを削除する
  # blog.delete_entry(updated_entry.id)
end
