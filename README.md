# キャンプ予約アプリ【作成中】

キャンプの宿泊予約アプリです。<br>
管理ユーザーは宿泊商品の作成・更新、予約一覧の管理が行えます。<br>
利用ユーザーは宿泊商品の予約・検索・レビュー・お問い合わせが行えます。<br>


## アプリ作成にあたって解決したいこと

現状、宿泊予約の管理を電話のみで対応している。<br>
管理者が不在の時間は電話対応が出来ないため、見込みユーザーのロスを無くしたい。<br>
また、人的ミスでの予約忘れ・二重予約を無くしたい。<br>


## 機能一覧

### 管理ユーザー
- 宿泊商品の作成・更新・削除
- 宿泊商品の予約管理（未実装）
- お問い合わせの対応

### 利用ユーザー
- 宿泊商品の予約
- 宿泊商品のレビュー（未実装）
- お問い合わせ（未実装）


## 使用言語・技術
**フレームワーク・言語**
- Ruby on Rails
- Ruby
- Haml
- SCSS
- jQuery

**データベース**
- MySQL5.7

**バージョン管理**
- Git(GitHub)

**AWSインフラ環境**

- EC2
  - Nginx
  - Unicorn
- Route53
- ELB

**デプロイ**

- Capistrano
