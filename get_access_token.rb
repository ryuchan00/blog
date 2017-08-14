#!/usr/bin/env ruby
# coding: utf-8

# The MIT License (MIT)

# Copyright (c) 2015 Kohei Yamamoto

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'oauth'

USAGE = 'Usage: ruby get_access_token.rb <consumer key> <consumer secret>'

SITE_URI          = 'https://www.hatena.com'
REQUEST_TOKEN_URI = '/oauth/initiate?scope=read_public%2Cread_private%2Cwrite_public%2Cwrite_private'
ACCESS_TOKEN_URI  = '/oauth/token'

if ARGV.size != 2
  warn USAGE
  exit
end

consumer_key    = ARGV[0]
consumer_secret = ARGV[1]
consumer = OAuth::Consumer.new(consumer_key,
                               consumer_secret,
                               site: SITE_URI,
                               request_token_url: REQUEST_TOKEN_URI,
                               access_token_url: ACCESS_TOKEN_URI,
                               oauth_callback: 'oob')

request_token = consumer.get_request_token
puts "Visit this website and get the oauth verifier: #{request_token.authorize_url}"
print 'Enter the oauth verifier:'

consumer.options.delete(:oauth_callback)
oauth_verifier = STDIN.readline.chomp
access_token = request_token.get_access_token(oauth_verifier: oauth_verifier)
puts "Access token: #{access_token.token}"
puts "Access token secret: #{access_token.secret}"
