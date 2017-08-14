#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'atomutil'

USERNAME    = ARGV[0]
BLOG_DOMAIN = ARGV[1]
PASSWORD    = ARGV[2]

POST_URI = "http://blog.hatena.ne.jp/#{USERNAME}/#{BLOG_DOMAIN}/atom/entry"

auth = Atompub::Auth::Wsse.new(
  username: USERNAME,
  password: PASSWORD
)
client = Atompub::Client.new(auth: auth)

p client

entry = Atom::Entry.new(
  title: "テストエントリ".encode('BINARY', 'BINARY'),
#   content: <<'ENDOFCONENT'.encode('BINARY', 'BINARY'))
# *もちろん
# - はてな記法も
# - 書けます
# ENDOFCONENT
content: <<'ENDOFCONENT'.encode('BINARY', 'BINARY'))
<?xml version="1.0" encoding="utf-8"?>
<entry xmlns="http://www.w3.org/2005/Atom"
       xmlns:app="http://www.w3.org/2007/app">
  <title>エントリタイトル</title>
  <author><name>name</name></author>
  <content type="text/plain">
    ** エントリ本文
  </content>
  <updated>2008-01-01T00:00:00</updated>
  <category term="Scala" />
  <app:control>
    <app:draft>{yes | no}</app:draft>
  </app:control>
</entry>
ENDOFCONENT


p client.create_entry(POST_URI, entry);
