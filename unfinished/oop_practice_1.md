【オブジェクト指向のこころ】第１章　練習問題解答

書籍感想

# 1.10.1 基礎

### 1.機能分解の基本的なアプローチを解説してください。

A.

機能分解は、問題を小さな機能にブレークダウンするということで、その問題を構成する機能要素の洗い出しを行うこと手法です。

この手法は、将来に対して柔軟に太江うすることが難しくなる問題点もあります。

(p.4)

### 2.要求の変更を引き起こす3つの理由とはなんでしょうか?

A.

- 開発者とディスカッションを行うたびに、ユーザーがソフトウェアの新たな可能性に気づき、自らニーズを変更する。
- ソフトウェア開発の進展に伴い、問題領域に対する理解が深まり、開発者側の考えかたが変わってくる。
- ソフトウェア開発を取り巻いている環境が変化する。

### 3.機能に着目するよりも責任に着目する方が良いとされています。これはどういった意味を持つのでしょうか?例を挙げてみてください。

問題領域を機能に分解していくのではなく、責任を持たせているオブジェクトに分解していくべきである。
例

|オブジェクト|その責任|
|:--|:--|
|学生|今いる教室を知っておくこと|
||次のセミナーが行われる教室を知っておくこと|
||今いる教室から次の教室にいくこと|
|講師|次の教室に向かうよう、学生に告げること|
|教室|自らの位置を知っておくこと|
|情報提供者|今いる教室と次の教室を与えると、行き方を教えるということ|

(p.12~13)

### 4.結合度と凝集度の定義を答えてください。結合度が高いというのはどういうことでしょうか?

A.

結合度:「2つのルーチン間の関連の強さ」を表す尺度

凝集度を補完するものである。

凝集度:「ルーチン内の演算がどれだけ密接に関係しているのか」を表す尺度

凝集度はルーチン内の中身がどれだけ強く関連し合っているのかを示すものであり、結合度はあるルーチンが他のルーチンとどれだけ強く関連しあっているのかを示すものである。

(p.8)

### 5.オブジェクトにとってのインターフェースの目的はなんでしょうか?

### 6.クラスのインスタンスの定義を答えてください。

### 7.クラスとは、オブジェクトの完全な振る舞いを定義したものです。オブジェクトが定義する3つの観点とはなんでしょうか?

### 8.抽象クラスとは何を行うものでしょうか?

### 9.オブジェクトが保持できるアクセス可能性にはどのようなものがあるでしょうか?

### 10.カプセル化の定義を答えてください。また、振る舞いをカプセル化する例を挙げてください。

### 11.ポリモーフィズムの定義を答えてください。また、ポリモーフィズムの例を挙げてください。
