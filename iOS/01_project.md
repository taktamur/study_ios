01_iOSアプリのプロジェクト作成
====

今回のゴール
----
* iOS向けプロジェクトを作成します。
* UnitTestについて軽く触れます。
* ApplicationDelegateについて軽く触れます
* ソース管理(Git)について軽く触れます。

実践
----
iOS向けのプロジェクトを作成しましょう。作成時には"iOS"→"Application"→Empty Application"を選択します。

* 入力フィールドは適当でOKですが、チェックボックスは以下のようにします。
	* Use Core Data: off
	* Use Auto	matic Referrence Counting: off
	* Include Unit Tests: **ON**

* source Controlのチェックを**ON**にします（=Gitでのソース管理)

ここまでで以下ファイルができあがっています。

![初期状態](https://img.skitch.com/20120828-pi8ew71y39xikrxe3g6i7tj64s.jpg)

* プロジェクト設定: アプリ全体の設定、後ほどお世話になります。
* アプリ本体のソース: XXAppDelegate.(m|h)とSupportFiles/main.cだけ生成されます。
* UnitTestのソース
* Framework(への参照)
* バイナリなアプリ本体（の置き場所)

* ここまでで一度左上の ▶ を押して実行してみましょう。
	* エミュレータが起動します。
	* 停止は左上の ■

XXAppDelegateって何？
----
アプリが起動/終了/バックグラウンドに移動/ 等々した際に、呼び出されるクラスです。
[参考](http://cocoadays.blogspot.jp/2010/08/uiapplicationdelegate.html)
[参考2:状態遷移図付き](http://d.hatena.ne.jp/yaguta/20100624/1277389302)

アプリ起動時に画面を組み立てたりログイン処理をしたり、終了時にデータを保存したりするときここを触ります。

実践
----
XXAppDelegate.mにデフォルトで入っているメソッドの中にNSLogを仕込んで、
エミュレータでのアプリを動かしたり止めたりしてログの出方を確認しましょう。

UnitTestって何?
----
XCodeには、[SunTestSuete](http://www.google.co.jp/search?q=SenTestCase&aq=f&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8)というUnitTestモジュールが組み込まれています。

* まずはUnitTestを実行してみます。
	* 左上の▶を押しっぱなしにすると、Test が出てくるのでそれを選択。
	* Command+U でも実行します。
* exp_emptyTests.mにテストする内容がかいてあります。（デフォルトはSTFailだけ)
* 今流行のテストファーストする場合は、ここにテストを書いていきます、が今は飛ばします。
* UnitTestのファイルを生成する際には、"NewFiles"→"Coccoa touch"→"Objective-C test case class"でテンプレート作成されます。

ソース管理(Git)って何？
----
XCodeのソース管理は、Gitにて行われています。

* "File"→"Source Control"でgitコマンドが使えます。
* ターミナルで"git status"等してもOKです。
	* ごくたまに、XCodeからGitがコントロールできなくなる場合は、ターミナルで問題を解消したりします。

Gitそのものの使い方はここではやりません。[ぐぐったり](http://www.google.co.jp/search?q=SenTestCase&aq=f&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8#hl=ja&gs_nf=1&pq=git%E5%85%A5%E9%96%80&cp=4&gs_id=e&xhr=t&q=Git+%E5%85%A5%E9%96%80&pf=p&sclient=psy-ab&oq=Git+%E5%85%A5%E9%96%80&gs_l=&pbx=1&bav=on.2,or.r_gc.r_pw.r_qf.&fp=9e3ec1341b556020&biw=948&bih=561)、[本で勉強したり](http://www.amazon.co.jp/%E5%85%A5%E9%96%80git-Travis-Swicegood/dp/427406767X)してください。

おまけ
----
* "Use Auto matic Referrence Counting"(ARC)は、メモリのretain/release等をコンパイラが自動でやってくれる便利な仕掛けですが、
iOS5からの対応となっています。いまだiOS3/4系をターゲットにしている場合、使えません。
    * iOS4系でも使えるらしいはらしいけど、実績が無く恐ろしい。
* プロジェクト生成時に、「Prefix」という枠がありました。通常ここに2〜3文字の「プロジェクト固有の頭文字」を設定します。するとこのプロジェクトの中でクラスを生成したりすると、自動で頭文字がつくようになります。Appleの作法として、このプレフィックス付きが奨励されています。
	* 途中変更する方法がまだわからず・・・
* 