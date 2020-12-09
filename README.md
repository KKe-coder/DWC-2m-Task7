## 雑多メモ

1. git cloneを用いたローカルリポジトリDL方法(master branch)
   - environment にて `git clone [DL先URL]` 実行
   - `mv [変更前のdir名] [変更後のdir名] `でdir名を変更する
   - `cd [変更後のdir名]`でディレクトリ移動
   - `git init`にてgit作業フォルダに指定
   - `git remote set-url origin [UP先のURL]`でリポジトリを指定する
   - `git remote show origin`でリモートリポジトリリンク先を参照(確認)
   - 残りは通常通りpush

2. git commit-id を指定してその状況までローカルリポジトリを戻す方法
   - `git log`を用いて余計なcommit位置の確認をする(`"q"`で画面から抜ける)
   - `git revert [commit-id]`でコミット履歴に状態を戻す(コミット履歴に残る形)
   - 画面に入ったら`"^X"` で画面から抜ける

3. git commit 履歴の削除

   - `git rebase -i [commit-id]`で過去のコミット履歴を削除できる

   - 直前のコミットならば`[commit-id]`を`HEAD^`とすればよい

   - 拾ったログの`pick`を`drop`とするか、行を全削除する

   - 既に一度`git push origin master`を行った場合、ローカルとリモートのcommit状況が異なり、`[git rejected]`と弾かれるので、`git fetch`後、`git rebase origin master`でpush出来る。履歴はこのpush方法だと一番最後になる。

     

4. ディレクトリを含んだコンソールにおける削除

   - `rm -rf [ディレクトリ名]` 警告なしでディレクトリ削除

     

5. 時間のかかったところ

   - `CoffeeScript`はインデントが重要である。改行しないことでエラーが発生してしまっていた。

   - エラー発生後住所の自動入力が動作しない？　users.coffee 1行目を、

      `$(document).on 'turbolinks:load', ->`　とすることで解決した。

     

6. 残りの微調整

   - カラムの削除 userテーブルより`address_building`カラムを削除する

     `$ rails g migration RemoveAddressBuildingFromUsers address_building:string`

     `$ rails db:migrate`

     -> schema.rbで確認済

   - views/devise/registrations/new.html.erbの記述を変更

     `:address_building`部分入力field削除

   - app/assets/javascripts/users.coffeeの記述を変更

      `:address_building`部分削除

      `"%5"`はstreetよりcity側に移す。

   - app/controllers/application_controller.rbの住所保存ストロングパラメータ部を変更

      `:address_building`を削除する

     -> pry  current_userを用いてデータに住所パラメータが格納されていることを確認済

     

     以上

     

