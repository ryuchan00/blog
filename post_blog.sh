git diff --name-only | grep .md | xargs -I{} ruby hatena_post.rb {}
