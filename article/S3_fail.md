S3にアップロードしようと思ったら、時計がズレていたので失敗した。

# 環境

- Vagrant
- VirtualBox
- CentOS release 6.4 (Final)


# S3にアップロードしようと思ったら失敗した。

S3にアップロードしようと思ったら、以下のメッセージが返ってきました。

```
The difference between the request time and the current time is too large.
```

日本語訳:リクエストサーバーとS3の時間のズレが大きすぎる

同様の問題の解決記事

[[Rails] 時計のズレが原因でS3への画像アップロードが失敗した
](https://kadoppe.com/archives/2013/10/rails-carrierwave-s3-upload-failure.html)

# 原因は、S3のサーバー時刻とWebサーバー時刻にズレがあったため

まず`ntpdate`で自分のサーバーの時刻と日本標準時間を同期します。
Webサーバーは、vagrantを使用しています。

```bash
$ sudo ntpdate ntp.nict.jp
 6 Aug 14:02:10 ntpdate[7681]: adjust time server 133.243.238.244 offset 0.003161 sec
```

 ## ntpdateとは

>ntpdateコマンドでは、日付と時刻をNTPサーバーと同期するコマンドです。

[ntpdate - 日付と時刻をNTPサーバーと同期 - Linuxコマンド](https://webkaru.net/linux/ntpdate-command/)

以下`ntpd`関連資料

[NTPサーバー構築(ntpd)](https://centossrv.com/ntp.shtml)

[14.4. ntpd の起動と動作確認](http://www.turbolinux.co.jp/products/server/11s/user_guide/x6278.html)

ntpdデーモンの設定を変更したので、ntpdを再起動しましょう。

```bash
$ sudo /etc/rc.d/init.d/ntpd restart
ntpd を停止中:                                             [  OK  ]
ntpd を起動中:                                             [  OK  ]
```

これでOK!!
