#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'dotenv'
Dotenv.load ".env"
require 'hatenablog'

# config.ymlの作成
file = File.open("./config.yml", "w")
file.write "consumer_key: " + ENV['CONSUMER_KEY'] + "\n"
file.write "consumer_secret: " + ENV['CONSUMER_SECRET'] + "\n"
file.write "access_token: " + ENV['ACCESS_TOKEN'] + "\n"
file.write "access_token_secret: " + ENV['ACCESS_TOKEN_SECRET'] + "\n"
file.write "user_id: " + ENV['USER_ID'] + "\n"
file.write "blog_id: " + ENV['BLOG_ID'] + "\n"
file.close

inputFile = ARGV[0].to_s
title = ""
body = ""
category = []

# ファイルの存在確認をする
unless File.exist?(inputFile)
    puts inputFile + "は存在しません"
    exit
end

File.open(inputFile) do |file|
  if title.empty? && category.empty?
    title = file.gets
    file.gets
    category = file.gets.split(",")
    category.map! {|item| item.strip}
  end
  body = file.read
end

# デフォルトでは 'conf.yml' から OAuth 設定を読み込む
Hatenablog::Client.create do |blog|
    posted_entry = blog.post_entry(title,
                                body,
                                category)
end
p "[title]" + title.to_s + "は投稿されました。"
