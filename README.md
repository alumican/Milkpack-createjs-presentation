第3回 CreateJS 勉強会のプレゼン資料
==========================

第3回 CreateJS 勉強会で発表した「pushState を使ったフルCreateJSサイトの作り方」のプレゼン資料です。

Milkpack.js と CreateJS の連携サンプルと詳細なソースコードも併せてご覧ください。  
[https://github.com/alumican/Milkpack-createjs-example](https://github.com/alumican/Milkpack-createjs-example)

時間がなかったので資料の中にある createjs.DOMElement は使わずにすべて canves でレンダリングしています。

実際に動くものを見る
------
[http://lab.alumican.net/createjs_seminar/03/presentation/](http://lab.alumican.net/createjs_seminar/03/presentation/)

ローカルでの再生を前提として作成したため読み込みに時間がかかります。

左右キーで前後のスライドへ移動、上キーでトップページへ移動します。
デスクトップでのプレゼンを想定しているため操作しづらいですが、トップページでは各スライドをタップ可能で、下層ページでは画面の左側をタップで戻み、右側をタップで進みます。

自分の環境で動かす
------
deploy ディレクトリがホストのルートになるように apache ローカルサーバ上で動かしてください。

apache 以外の環境で動かす場合は、下層ページへのダイレクトアクセスをルートにリダイレクトする処理を適宜設定してください。
つまり、[kazitori.js](https://github.com/glassesfactory/kazitori.js) が動く環境であれば動きます。

改造する
------
src ディレクトリの中にソースコード一式が入っています。
Application.coffe が起点となっているのでそちらから読み進めるのがよいでしょう。

CoffeeScript のコンパイルには [grunt](http://gruntjs.com/) のバージョン0.4以降を使用しています。
grunt-cli、node.js がインストールされている環境であれば、package.json があるディレクトリで `npm install` を実行すると grunt の環境が構築されるはずです。

ライセンス
------
プレゼンのテキストに関してはそのままの流用は避けてください。その他ライブラリに関するライセンスは各ライブラリに従ってください。
