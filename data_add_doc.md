
<!-- 手順をドキュメントとしてまとめる -->

<!-- 
要件:
1. データベースを構築方法がわかる
2. ステップ1で設計したテーブルを構築方法がわかる
3. データの登録方法がわかる
 -->

<!-- 
演習目的:
この環境において、データ抽出クエリを試せるようにする事
再現可能な状態を作る事
ドキュメントコミュニケーション力を上げる事
 -->

# データベースの設計と操作手順について

## 目次

1. [データベースの設計と構築](#11-データベースの設計)
2. [テーブルの作成](#2-テーブルの作成)
3. [データの登録](#3-データの登録)

## 1. データベースの設計と構築

![itv.png](https://gyazo.com/0bb7001306f82fef4b1428ab3a3853e6.png)



### 1.1. データベースの設計

外部キー制約による依存関係がある為、テーブルの作成・データの追加は図において下から上へ行う。

例として、スケジュールテーブルに追加する場合、チャンネルテーブルの存在は必要で、エピソードテーブル以下への操作は不要。

<br>

### 1.2. DBMSの構築

同じディレクトリにあるDockerfileをビルドし、コンテナを起動する。

```bash
docker build -t ubsql .
docker run --name dbtest -p 53306:3306 -v ~/docker/dbtest:/bind_mount -d -it ubsql
docker exec -it dbtest bash
```

MySQLの設定を行う。

```sql
mysql -u root -p
SET NAMES utf8mb4;
CREATE USER 'stru'@'localhost' IDENTIFIED BY 'ctured';

/* 下記では、全ての権限を持つユーザーに全てのドメインからアクセスを許可しています。 */
GRANT ALL PRIVILEGES ON *.* TO 'stru'@'%';

FLUSH PRIVILEGES;
exit
```

ポートから通信する準備を行ったので、ここからはMySQLのサーバー内から操作する必要はない。

MySQLはデフォルトで3306ポートを使用するが、コンテナのポートを53306にマッピングしている為、接続時にそのポート番号を指定する。

```bash
mysql -h 192.168.1.131 -P 53306 -u stru -p
```

ログインできればDBMSの設定は完了。


<br>

## 2. データベースの作成

## 3. テーブルの作成


### チャンネル

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| チャンネルID  |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| チャンネル名  |VARCHAR(255)  |    |1   |    |   |    |    |   |    |


### スケジュール

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| スケジュールID|INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| チャンネルID  |INT           |    |1   |    |   |    |    |   |1   |
| 放送開始at    |datetime      |    |1   |    |   |    |    |   |    |
| 放送終了at    |datetime      |    |1   |    |   |    |    |   |    |


### ブロードキャスト

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| ブロードキャストID|INT       |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| エピソードID  |INT           |    |1   |    |   |    |    |   |1   |
| スケジュールID|INT           |    |1   |    |   |    |    |   |1   |


### エピソード

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| エピソードID  |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
|エピソードタイトル|VARCHAR(255)|   |1   |    |   |    |    |   |    |
| description   |text          |    |1   |    |   |    |    |   |    |
| 再生時間      |INT           |    |1   |    |   |    |    |   |    |
| オンエアat    |datetime      |    |1   |    |   |    |    |   |    |
| view_count    |INT           |    |1   |    |   |    |    |   |    |
| プログラムID  |INT           |    |1   |    |   |    |    |   |1   |


### プログラム

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| プログラムID  |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
|プログラムタイトル|VARCHAR(255)|   |1   |    |   |    |    |   |    |
| description   |text          |    |1   |    |   |    |    |   |    |
| シーズンID    |INT           |    |1   |    |   |    |    |   |1   |
|メインジャンルID|INT          |    |1   |    |   |    |    |   |1   |


### シーズン

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| シーズンID    |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| シーズン名    |VARCHAR(255)  |    |1   |    |   |    |    |   |    |


### シリーズマッピング

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
|シリーズマッピングID    |INT  |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| プログラムID  |INT           |    |1   |    |   |    |    |   |1   |
| シリーズID    |INT           |    |1   |    |   |    |    |   |1   |


### シリーズ

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| シリーズID    |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| シリーズ名    |VARCHAR(255)  |    |1   |    |   |    |    |   |    |


### ジャンルマッピング

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| ジャンルマッピングID|INT     |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| プログラムID  |INT           |    |1   |    |   |    |    |   |1   |
| ジャンルID    |INT           |    |1   |    |   |    |    |   |1   |



### ジャンル

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| ジャンルID    |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| ジャンル名    |VARCHAR(255)  |    |1   |    |   |    |    |   |    |


### ブロードキャストメトリクス

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
|ブロードキャストメトリクスID|INT|1 |1   |1   |   |    |1   |   |    |
|クリエイトat   |datetime      |    |1   |    |   |    |    |   |    |
|ブロードキャストID|INT        |    |1   |    |   |    |    |   |1   |
|メトリクスマーカーファンクションID|INT||1|   |   |    |    |   |1   |


### メトリクスマーカーファンクション

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
|メトリクスマーカーファンクションID|INT|1|1|1 |   |    |1   |   |    |
|クリエイトat   |datetime      |    |1   |    |   |    |    |   |    |
|ファンクション名|VARCHAR(255) |    |1   |    |   |    |    |   |    |
|ファンクション|text           |    |1   |    |   |    |    |   |    |

<br>

## 4. データの登録

<br>


-- Add series
INSERT INTO series (created_at, series_name)
VALUES (NOW(), 'Series 1'), (NOW(), 'Series 2');

-- Add genres
INSERT INTO genre (created_at, genre_name)
VALUES (NOW(), 'Action'), (NOW(), 'Comedy'), (NOW(), 'Drama');

-- Add seasons
INSERT INTO season (created_at, season_name)
VALUES (NOW(), 'Season 1'), (NOW(), 'Season 2');

-- Add programs
INSERT INTO program (created_at, program_title, description, season_id, main_genre_id)
VALUES 
(NOW(), 'Program 1', 'Program 1 Description', 1, 1),
(NOW(), 'Program 2', 'Program 2 Description', 2, 2),
(NOW(), 'Program 3', 'Program 3 Description', 1, 3),
(NOW(), 'Program 4', 'Program 4 Description', 2, 3);

-- Add episodes
INSERT INTO episode (created_at, episode_title, description, playtime, on_air, views, program_id)
VALUES 
(NOW(), 'Episode 1', 'Episode 1 Description', 60, NOW(), 1000, 1),
(NOW(), 'Episode 2', 'Episode 2 Description', 90, NOW(), 2000, 2),
(NOW(), 'Episode 3', 'Episode 3 Description', 45, NOW(), 3000, 3),
(NOW(), 'Episode 4', 'Episode 4 Description', 120, NOW(), 4000, 4);

-- Add series mapping
INSERT INTO series_mapping (created_at, program_id, series_id)
VALUES 
(NOW(), 1, 1),
(NOW(), 2, 2);

-- Add genre mapping
INSERT INTO genre_mapping (created_at, program_id, genre_id)
VALUES 
(NOW(), 1, 1),
(NOW(), 2, 2),
(NOW(), 3, 3),
(NOW(), 4, 3);

-- Add channels
INSERT INTO channel (created_at, channel_name)
VALUES (NOW(), 'Channel 1'), (NOW(), 'Channel 2');

-- Add schedules
INSERT INTO schedule (created_at, channel_id, start_time, end_time)
VALUES 
(NOW(), 1, NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR)),
(NOW(), 2, DATE_ADD(NOW(), INTERVAL 1 HOUR), DATE_ADD(NOW(), INTERVAL 2 HOUR));

-- Add metrics marker function
INSERT INTO metrics_marker_function (created_at, function_name, function_content)
VALUES 
(NOW(), 'Metrics Function 1', 'Function Content 1'),
(NOW(), 'Metrics Function 2', 'Function Content 2');

-- Add broadcast
INSERT INTO broadcast (created_at, episode_id, schedule_id)
VALUES 
(NOW(), 1, 1),
(NOW(), 2, 2),
(NOW(), 3, 1),
(NOW(), 4, 2);

-- Add broadcast metrics
INSERT INTO broadcast_metrics (created_at, broadcast_id, metrics_marker_function_id)
VALUES 
(NOW(), 1, 1),
(NOW(), 2, 2);



docker build -t ubsql .
docker run --name dbtest -p 53306:3306 -v ~/docker/dbtest:/bind_mount -d -it ubsql
docker exec -it dbtest bash
mysql -u root -p

service mysql start

DROP DATABASE internet_tv;
SHOW TABLES;

```bash

docker run --name dbtest2 -e MYSQL_ROOT_PASSWORD=test123 -p 53307:3306 -v ~/docker/dbtest:/bind_mount -d mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
docker exec -it dbtest2 bash

mysql -u root -p

SET NAMES utf8mb4;
CREATE USER 'stru'@'localhost' IDENTIFIED BY 'ctured';
GRANT ALL PRIVILEGES ON *.* TO 'stru'@'%';
FLUSH PRIVILEGES;
exit
mysql -u stru -p

```
```sql

CREATE DATABASE internet_tv;
USE internet_tv;
CREATE TABLE series (
    series_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    series_name VARCHAR(255) NOT NULL
);

CREATE TABLE genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE season (
    season_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    season_name VARCHAR(255) NOT NULL
);

CREATE TABLE program (
    program_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    season_id INT NOT NULL,
    main_genre_id INT NOT NULL,
    FOREIGN KEY (season_id) REFERENCES season(season_id) ON DELETE CASCADE,
    FOREIGN KEY (main_genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);

CREATE TABLE episode (
    episode_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    episode_title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    playtime INT NOT NULL,
    on_air DATETIME NOT NULL,
    views BIGINT NOT NULL DEFAULT 0,
    program_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id) ON DELETE CASCADE
);

CREATE TABLE series_mapping (
    series_mapping_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_id INT NOT NULL,
    series_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id) ON DELETE CASCADE,
    FOREIGN KEY (series_id) REFERENCES series(series_id) ON DELETE CASCADE
);

CREATE TABLE genre_mapping (
    genre_mapping_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);


CREATE TABLE channel (
    channel_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    channel_name VARCHAR(255) NOT NULL
);

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    channel_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (channel_id) REFERENCES channel(channel_id) ON DELETE CASCADE
);

CREATE TABLE metrics_marker_function (
    metrics_marker_function_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    function_name VARCHAR(255) NOT NULL,
    function_content TEXT NOT NULL
);

CREATE TABLE broadcast (
    broadcast_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    episode_id INT NOT NULL,
    schedule_id INT NOT NULL,
    FOREIGN KEY (episode_id) REFERENCES episode(episode_id) ON DELETE CASCADE,
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id) ON DELETE CASCADE
);

CREATE TABLE broadcast_metrics (
    broadcast_metrics_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    broadcast_id INT NOT NULL,
    metrics_marker_function_id INT NOT NULL,
    FOREIGN KEY (broadcast_id) REFERENCES broadcast(broadcast_id) ON DELETE CASCADE,
    FOREIGN KEY (metrics_marker_function_id) REFERENCES metrics_marker_function(metrics_marker_function_id) ON DELETE CASCADE
);


/* シリーズここから */
INSERT
    INTO series (created_at, series_name)
  VALUES (NOW(), 'Aシリーズ')
;
INSERT
    INTO series (created_at, series_name)
  VALUES (NOW(), 'Bシリーズ')
;
INSERT
    INTO series (created_at, series_name)
  VALUES (NOW(), 'Cシリーズ')
;
INSERT
    INTO series (created_at, series_name)
  VALUES (NOW(), 'Dシリーズ')
;
/* シリーズここまで */

/* ジャンルここから */
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'ストア')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '新着')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '本日無料')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'アニメ')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'MLB')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'プレミアリーグ')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'ブンデスリーガ')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'バラエティ')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '恋愛番組')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '映画')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'ドラマ')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'スポーツ')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'ニュース')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '韓流・華流')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'K-POP')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '将棋')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '麻雀')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'HIPHOP')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '格闘')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'テレ朝見逃し')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), 'ドキュメンタリー')
;
INSERT
    INTO genre (created_at, genre_name)
  VALUES (NOW(), '音楽')
;
/* ジャンルここまで */

/* シーズンここから */
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ひかりの森のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '風を追いかけてのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '星空カフェのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '美食の旅路のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '密着！アイドル生活のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '海辺の物語のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '素晴らしき世界のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '恋するキッチンのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ミッドナイト・トークのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ミステリーナイトのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '昼下がりの詩のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'フラワーガーデンのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'パワフルスポーツのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'グローバルニュースのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ハイテク探偵団のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'サンセットドライブのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'トワイライトメロディーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ドキドキ冒険団のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'おいしいレシピのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '雪のプリンセスのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '炎のダンスのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '未来予想図のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ワンダーランドのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'かわいいペットのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'マジカルジャーニーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'スリリングな夜のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'スパイシーライフのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '夢見るピアノのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '都市の風景のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '星降る夜にのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'アクアブルーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '音楽の時間のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'トロピカルパラダイスのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ロマンティック・エンカウンターのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'お笑いチャンピオンのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ナイトウォーカーズのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'マジックタイムのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '花と風の調べのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ファンタジーアイランドのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '旅する心のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'レインボーダンスのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'フレッシュモーニングのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ビューティフル・ハーモニーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ハートフルストーリーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ドリームキャッチャーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'スターライトシンフォニーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'プレシャスメモリーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'さわやかウィンドのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), '音楽の海のシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'フレンドリータウンのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'マジカルワールドのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'スマイル・デイのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ドキドキ・デートのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'スパークリング・モーメントのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ローズガーデンのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'フレンズ・フォーエバーのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'シークレット・レシピのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ハッピーデイズのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'スイートドリームスのシーズン')
;
INSERT
    INTO season (created_at, season_name)
  VALUES (NOW(), 'ドリームのシーズン')
;
/* シーズンここまで */

/* プログラムここから */

INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ひかりの森', '説明文', 1, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '風を追いかけて', '説明文', 2, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '星空カフェ', '説明文', 3, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '美食の旅路', '説明文', 4, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '密着！アイドル生活', '説明文', 5, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '海辺の物語', '説明文', 6, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '素晴らしき世界', '説明文', 7, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '恋するキッチン', '説明文', 8, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ミッドナイト・トーク', '説明文', 9, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ミステリーナイト', '説明文', 10, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '昼下がりの詩', '説明文', 11, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'フラワーガーデン', '説明文', 12, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'パワフルスポーツ', '説明文', 13, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'グローバルニュース', '説明文', 14, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ハイテク探偵団', '説明文', 15, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'サンセットドライブ', '説明文', 16, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'トワイライトメロディー', '説明文', 17, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ドキドキ冒険団', '説明文', 18, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'おいしいレシピ', '説明文', 19, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '雪のプリンセス', '説明文', 20, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '炎のダンス', '説明文', 21, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '未来予想図', '説明文', 22, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ワンダーランド', '説明文', 23, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'かわいいペット', '説明文', 24, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'マジカルジャーニー', '説明文', 25, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'スリリングな夜', '説明文', 26, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'スパイシーライフ', '説明文', 27, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '夢見るピアノ', '説明文', 28, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '都市の風景', '説明文', 29, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '星降る夜に', '説明文', 30, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'アクアブルー', '説明文', 31, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '音楽の時間', '説明文', 32, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'トロピカルパラダイス', '説明文', 33, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ロマンティック・エンカウンター', '説明文', 34, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'お笑いチャンピオン', '説明文', 35, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ナイトウォーカーズ', '説明文', 36, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'マジックタイム', '説明文', 37, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '花と風の調べ', '説明文', 38, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ファンタジーアイランド', '説明文', 39, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '旅する心', '説明文', 40, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'レインボーダンス', '説明文', 41, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'フレッシュモーニング', '説明文', 42, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ビューティフル・ハーモニー', '説明文', 43, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ハートフルストーリー', '説明文', 44, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ドリームキャッチャー', '説明文', 45, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'スターライトシンフォニー', '説明文', 46, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'プレシャスメモリー', '説明文', 47, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'さわやかウィンド', '説明文', 48, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), '音楽の海', '説明文', 49, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'フレンドリータウン', '説明文', 50, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'マジカルワールド', '説明文', 51, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'スマイル・デイ', '説明文', 52, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ドキドキ・デート', '説明文', 53, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'スパークリング・モーメント', '説明文', 54, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ローズガーデン', '説明文', 55, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'フレンズ・フォーエバー', '説明文', 56, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'シークレット・レシピ', '説明文', 57, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ハッピーデイズ', '説明文', 58, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'スイートドリームス', '説明文', 59, 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id, main_genre_id)
  VALUES (NOW(), 'ドリーム', '説明文', 60, 1)
;
/* プログラムここまで */

/* エピソードここから */

INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '夜明けの歌', '説明文', 30, '2023-04-20 18:00:00', 1)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '光と影のダンス', '説明文', 30, '2023-04-27 18:00:00', 1)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '森の囁き', '説明文', 30, '2023-05-04 18:00:00', 1)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '秘密の池', '説明文', 30, '2023-05-11 18:00:00', 1)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '風の旅人', '説明文', 45, '2023-04-21 20:00:00', 2)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '遥かなる山々', '説明文', 45, '2023-04-28 20:00:00', 2)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '星空の下で', '説明文', 50, '2023-04-22 22:00:00', 3)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '月明かりの会話', '説明文', 50, '2023-04-29 22:00:00', 3)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '大阪の美食', '説明文', 60, '2023-04-23 20:00:00', 4)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '京都の美食', '説明文', 60, '2023-04-30 20:00:00', 4)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '初ステージ', '説明文', 50, '2023-04-24 20:00:00', 5)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '努力の日々', '説明文', 50, '2023-05-01 20:00:00', 5)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '初恋の予感', '説明文', 50, '2023-05-08 20:00:00', 5)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ライブ前夜', '説明文', 50, '2023-05-15 20:00:00', 5)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '夢のステージ', '説明文', 50, '2023-05-22 20:00:00', 5)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '海辺の思い出', '説明文', 60, '2023-04-25 18:00:00', 6)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '夏の終わり', '説明文', 60, '2023-05-02 18:00:00', 6)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '秋の始まり', '説明文', 60, '2023-05-09 18:00:00', 6)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '冬の訪れ', '説明文', 60, '2023-05-16 18:00:00', 6)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '春の予感', '説明文', 60, '2023-05-23 18:00:00', 6)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '世界の驚き', '説明文', 45, '2023-04-26 19:00:00', 7)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '未知への探求', '説明文', 45, '2023-05-03 19:00:00', 7)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '人類の進歩', '説明文', 45, '2023-05-10 19:00:00', 7)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '文化の交流', '説明文', 45, '2023-05-17 19:00:00', 7)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '大自然の美しさ', '説明文', 45, '2023-05-24 19:00:00', 7)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '初恋のレシピ', '説明文', 40, '2023-04-26 21:00:00', 8)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '母の味', '説明文', 40, '2023-05-03 21:00:00', 8)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '秘密のスパイス', '説明文', 40, '2023-05-10 21:00:00', 8)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '伝統の味', '説明文', 40, '2023-05-17 21:00:00', 8)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '未来の食事', '説明文', 40, '2023-05-24 21:00:00', 8)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '深夜の対話', '説明文', 60, '2023-04-27 00:00:00', 9)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '未明の思索', '説明文', 60, '2023-05-04 00:00:00', 9)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '謎解きの時間', '説明文', 45, '2023-04-27 21:00:00', 10)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '暗闇の秘密', '説明文', 45, '2023-05-04 21:00:00', 10)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '太陽の下で', '説明文', 30, '2023-04-28 13:00:00', 11)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '春風の中で', '説明文', 30, '2023-05-05 13:00:00', 11)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '花々の美学', '説明文', 40, '2023-04-28 14:00:00', 12)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '緑の風景', '説明文', 40, '2023-05-05 14:00:00', 12)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '熱戦の舞台', '説明文', 90, '2023-04-28 19:00:00', 13)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '挑戦の瞬間', '説明文', 90, '2023-05-05 19:00:00', 13)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '世界の動き', '説明文', 30, '2023-04-29 20:00:00', 13)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '新たな局面', '説明文', 30, '2023-05-06 20:00:00', 13)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep1', '説明文', 30, '2023-05-06 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep2', '説明文', 30, '2023-05-08 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep3', '説明文', 30, '2023-05-10 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep4', '説明文', 30, '2023-05-12 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep5', '説明文', 30, '2023-05-14 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep6', '説明文', 30, '2023-05-16 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep7', '説明文', 30, '2023-05-18 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep8', '説明文', 30, '2023-05-20 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep9', '説明文', 30, '2023-05-22 20:00:00', 14)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep1', '説明文', 30, '2023-05-22 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep2', '説明文', 30, '2023-06-12 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep3', '説明文', 30, '2023-06-22 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep4', '説明文', 30, '2023-07-12 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep5', '説明文', 30, '2023-07-22 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep6', '説明文', 30, '2023-08-12 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep7', '説明文', 30, '2023-08-22 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep8', '説明文', 30, '2023-09-12 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep9', '説明文', 30, '2023-09-22 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep10', '説明文', 30, '2023-10-16 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep11', '説明文', 30, '2023-10-26 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep12', '説明文', 30, '2023-11-16 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep13', '説明文', 30, '2023-11-26 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ep14', '説明文', 30, '2023-12-16 20:00:00', 15)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '夕暮れのドライブ', '説明文', 60, '2023-04-30 18:00:00', 16)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '星空下のドライブ', '説明文', 60, '2023-05-07 18:00:00', 16)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '夜の調べ', '説明文', 50, '2023-04-30 22:00:00', 17)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '夜明け前の旋律', '説明文', 50, '2023-05-07 22:00:00', 17)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '冒険への招待', '説明文', 40, '2023-04-29 16:00:00', 18)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '新たなる挑戦', '説明文', 40, '2023-05-06 16:00:00', 18)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '美味しいレシピの秘密', '説明文', 30, '2023-05-13 19:00:00', 19)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '冬の料理特集', '説明文', 30, '2023-05-20 19:00:00', 19)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '雪のプリンセスの目覚め', '説明文', 45, '2023-05-14 20:00:00', 20)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '冬の王国の冒険', '説明文', 45, '2023-05-21 20:00:00', 20)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '炎のダンスチャレンジ', '説明文', 60, '2023-05-13 21:00:00', 21)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ダンスバトル決定戦', '説明文', 60, '2023-05-20 21:00:00', 21)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '未来の可能性', '説明文', 50, '2023-05-14 22:00:00', 22)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '技術の進化', '説明文', 50, '2023-05-21 22:00:00', 22)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), 'ワンダーランドの旅', '説明文', 40, '2023-05-13 16:00:00', 23)
;
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '不思議な世界の探求', '説明文', 40, '2023-05-20 16:00:00', 23)
;
/* エピソードここまで */

/* シリーズマッピングここから */
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 1, 1)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 2, 1)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 3, 1)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 4, 2)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 10, 2)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 5, 3)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 6, 4)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 16, 4)
;
INSERT
    INTO series_mapping (created_at, program_id, series_id)
  VALUES (NOW(), 26, 4)
;
/* シリーズマッピングここまで */

/* ジャンルマッピングここから */

INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 1, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 2, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 3, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 4, 21)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 5, 4)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 6, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 7, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 8, 9)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 9, 8)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 10, 10)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 11, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 12, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 13, 12)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 14, 13)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 15, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 16, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 17, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 18, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 19, 21)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 20, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 21, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 22, 21)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 23, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 24, 21)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 25, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 26, 10)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 27, 8)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 28, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 29, 21)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 30, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 31, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 32, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 33, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 34, 9)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 35, 8)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 36, 10)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 37, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 38, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 39, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 40, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 41, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 42, 2)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 43, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 44, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 45, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 46, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 47, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 48, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 49, 22)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 50, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 51, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 52, 8)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 53, 9)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 54, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 55, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 56, 8)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 57, 21)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 58, 8)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 59, 11)
;
INSERT
  INTO genre_mapping (created_at, program_id, genre_id)
VALUES (NOW(), 60, 11)
;

/* ジャンルマッピングここまで */

SELECT * FROM season;
SELECT * FROM program;
SELECT * FROM series;
SELECT * FROM series_mapping;
SELECT * FROM genre;
SELECT * FROM genre_mapping;
SELECT * FROM episode;
SELECT * FROM channel;
SELECT * FROM schedule;
SELECT * FROM metrics_marker_function;
SELECT * FROM broadcast;
SELECT * FROM broadcast_metrics;

SELECT *
  FROM episode e
 INNER JOIN program p ON e.program_id = p.program_id
;


INSERT
    INTO channel (created_at, channel_name)
  VALUES (NOW(), 'チャンネル名')
;
INSERT
    INTO schedule (created_at, channel_id, start_time, end_time)
  VALUES (NOW(), チャンネルID, '開始時間', '終了時間')
;
INSERT
    INTO metrics_marker_function (created_at, function_name, function_content)
  VALUES (NOW(), '関数名', '関数内容')
;
INSERT
    INTO broadcast (created_at, episode_id, schedule_id)
  VALUES (NOW(), エピソードID, スケジュールID)
;
INSERT
    INTO broadcast_metrics (created_at, broadcast_id, metrics_marker_function_id)
  VALUES (NOW(), 放送ID, メトリクスマーカー関数ID)
;
```
