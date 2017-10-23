# 「^」「$」と「\A」「\z」の違い

```rb
# 「^」「$」は行頭と行末を表す。つまり「\n」ごとにマッチング処理を行う。
puts "aa\nbb\ncc\n".gsub(/^/, "M")
```

```result
Maa
Mbb
Mcc
```

```rb
# 「\A」「\z」は文字列の先頭、末尾を表す。複数行を一つの文字列としてみなしている。
puts "aa\nbb\ncc\n".gsub(/\A/m, "M")
```

```result
Maa
bb
cc
```

# 複数行モード

```rb
# 1行目のみマッチ
puts "aa\nbb\ncc\n".match(/\A.+/)
```

```result
aa
```

複数行モード「\m」

```rb
# 全行マッチ
puts "aa\nbb\ncc\n".match(/\A.+/m)
```

```result
aa
bb
cc
```
