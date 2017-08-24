# macのデフォルトapacheサーバーのon/offコマンド

自動起動

```
$ sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist
```

自動起動解除

```
$ sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
```

loadをunloadに変えるだけ

これで無事にMAMPが動いた
