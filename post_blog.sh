git diff HEAD^ --name-only | grep .md | xargs -I{} ruby hatena_post.rb {}
