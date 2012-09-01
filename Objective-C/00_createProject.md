Objective-C勉強時のプロジェクト作成
====

iOS勉強会の「Objective-C勉強」の際には、iOS(iPhoneアプリ）ではなく、MacOSのCommandLineToolプロジェクトを作成して、そのプロジェクトないで実践を行っていきます。これはGUIアプリを作り始める前に土台となるObjective-Cの学習に集中するためです。

CommandLineToolのプロジェクトは以下の方法で作成します。

* "New"→"Project"を選択し、その中の"MacOSX"→"Application"→CommandLineTool"を選択します。

![project選択](https://img.skitch.com/20120901-g867emmpqexkpadsjqcyji8u2x.jpg)

* プロジェクトのオプションを指定します。
	* Typeには「Foundation」を、「Use Automatic Reference Counting」は **OFF** にします。後は適当でOKです。
		* 「Use Automatic Reference Counting」(=ARCを使う)は、iOS5から使える機能です。勉強会ではこれは使わず進めていきます。

![Option](https://img.skitch.com/20120901-b8j8qwd3684pqugknf76sc12qx.jpg)

* プロジェクトはどこにおいてもかまいません。またGitリポジトリの作成はどっちでも良いです。
	* 田村は「書類」の下に置くことが多いです。
	* ソースコード管理はiOS編に入ってからやりたいと思います。

![ソースコード置き場](https://img.skitch.com/20120901-xi174e6sru3ec4kup1ikcur1m7.jpg)
 
これでプロジェクトが作成されます。

