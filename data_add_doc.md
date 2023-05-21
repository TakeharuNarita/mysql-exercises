
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
2. [データベースとテーブルの作成](#2-データベースとテーブルの作成)
3. [データの登録](#3-データの登録)

## 1. データベースの設計と構築

![itv.png](https://gyazo.com/0bd4981c98041ed9770f720a2410d161.png)



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
```bash
mysql -u root -p
```

MySQLの設定を行う。

```sql
SET NAMES utf8mb4;

/* 下記では、全ての権限を持つユーザーに全てのドメインからアクセスを許可しています。 */
CREATE USER 'stru'@'%' IDENTIFIED BY 'ctured';
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


## 2. データベースとテーブルの作成

データベースの作成
```sql
CREATE DATABASE internet_tv;
USE internet_tv;
SHOW DATABASES;
SELECT DATABASE();

```

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
|メトリクス値   |INT           |    |1   |    |   |    |    |   |    |


### メトリクスマーカーファンクション

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
|メトリクスマーカーファンクションID|INT|1|1|1 |   |    |1   |   |    |
|クリエイトat   |datetime      |    |1   |    |   |    |    |   |    |
|ファンクション名|VARCHAR(255) |    |1   |    |   |    |    |   |    |
|ファンクション|text           |    |1   |    |   |    |    |   |    |


これらのテーブルを作成。

```sql
CREATE TABLE series (
      series_id INT PRIMARY KEY AUTO_INCREMENT
    ,created_at DATETIME NOT NULL
   ,series_name VARCHAR(255) NOT NULL
);

CREATE TABLE genre (
      genre_id INT PRIMARY KEY AUTO_INCREMENT
   ,created_at DATETIME NOT NULL
   ,genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE season (
      season_id INT PRIMARY KEY AUTO_INCREMENT
    ,created_at DATETIME NOT NULL
   ,season_name VARCHAR(255) NOT NULL
);

CREATE TABLE program (
       program_id INT PRIMARY KEY AUTO_INCREMENT
      ,created_at DATETIME NOT NULL
   ,program_title VARCHAR(255) NOT NULL
     ,description TEXT NOT NULL
       ,season_id INT NOT NULL
   ,main_genre_id INT NOT NULL
   ,FOREIGN KEY (season_id) REFERENCES season(season_id) ON DELETE CASCADE
   ,FOREIGN KEY (main_genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);

CREATE TABLE episode (
       episode_id INT PRIMARY KEY AUTO_INCREMENT
      ,created_at DATETIME NOT NULL
   ,episode_title VARCHAR(255) NOT NULL
     ,description TEXT NOT NULL
        ,playtime INT NOT NULL
          ,on_air DATETIME NOT NULL
           ,views BIGINT NOT NULL DEFAULT 0
      ,program_id INT NOT NULL
   ,FOREIGN KEY (program_id) REFERENCES program(program_id) ON DELETE CASCADE
);

CREATE TABLE series_mapping (
    series_mapping_id INT PRIMARY KEY AUTO_INCREMENT
          ,created_at DATETIME NOT NULL
          ,program_id INT NOT NULL
           ,series_id INT NOT NULL
   ,FOREIGN KEY (program_id) REFERENCES program(program_id) ON DELETE CASCADE
   ,FOREIGN KEY (series_id) REFERENCES series(series_id) ON DELETE CASCADE
);

CREATE TABLE genre_mapping (
    genre_mapping_id INT PRIMARY KEY AUTO_INCREMENT
         ,created_at DATETIME NOT NULL
         ,program_id INT NOT NULL
           ,genre_id INT NOT NULL
   ,FOREIGN KEY (program_id) REFERENCES program(program_id) ON DELETE CASCADE
   ,FOREIGN KEY (genre_id) REFERENCES genre(genre_id) ON DELETE CASCADE
);


CREATE TABLE channel (
      channel_id INT PRIMARY KEY AUTO_INCREMENT
     ,created_at DATETIME NOT NULL
   ,channel_name VARCHAR(255) NOT NULL
);

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT
    ,created_at DATETIME NOT NULL
    ,channel_id INT NOT NULL
    ,start_time DATETIME NOT NULL
      ,end_time DATETIME NOT NULL
   ,FOREIGN KEY (channel_id) REFERENCES channel(channel_id) ON DELETE CASCADE
);

CREATE TABLE metrics_marker_function (
    metrics_marker_function_id INT PRIMARY KEY AUTO_INCREMENT
                   ,created_at DATETIME NOT NULL
                ,function_name VARCHAR(255) NOT NULL
             ,function_content TEXT NOT NULL
);

CREATE TABLE broadcast (
    broadcast_id INT PRIMARY KEY AUTO_INCREMENT
     ,created_at DATETIME NOT NULL
     ,episode_id INT NOT NULL
    ,schedule_id INT NOT NULL
   ,FOREIGN KEY (episode_id) REFERENCES episode(episode_id) ON DELETE CASCADE
   ,FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id) ON DELETE CASCADE
);

CREATE TABLE broadcast_metrics (
          broadcast_metrics_id INT PRIMARY KEY AUTO_INCREMENT
                   ,created_at DATETIME NOT NULL
                 ,broadcast_id INT NOT NULL
   ,metrics_marker_function_id INT NOT NULL
                ,metrics_value INT NOT NULL
   ,FOREIGN KEY (broadcast_id) REFERENCES broadcast(broadcast_id) ON DELETE CASCADE
   ,FOREIGN KEY (metrics_marker_function_id) REFERENCES metrics_marker_function(metrics_marker_function_id) ON DELETE CASCADE
);
SHOW TABLES;

```

<br>

## 3. データの登録

冒頭に記載している依存関係を考慮した順序に沿って解説。

テスト用サンプルがありますが、24,000行以上のテキストなので読み込む際は注意してください。

[テスト用サンプル](./sample)

- `series` テーブルへの追加: 'Series 1'と'Series 2'という名前の新しいシリーズを追加。作成日時は現在の時刻（NOW()）。

```sql
INSERT INTO series (created_at, series_name)
VALUES (NOW(), 'Series 1'), (NOW(), 'Series 2')
;
```
<br>

- `genre` テーブルへの追加: 'Action'、'Comedy'、'Drama'という新しいジャンルを追加。作成日時は現在の時刻。

```sql
INSERT INTO genre (created_at, genre_name)
VALUES (NOW(), 'Action'), (NOW(), 'Comedy'), (NOW(), 'Drama')
;
```
<br>

- `season` テーブルへの追加: 'Season 1'と'Season 2'という新しいシーズンを追加。作成日時は現在の時刻。

```sql
INSERT INTO season (created_at, season_name)
VALUES (NOW(), 'Season 1'), (NOW(), 'Season 2')
;
```
<br>

- `program` テーブルへの追加: 4つの新しいプログラムを追加。各プログラムには作成日時、プログラムタイトル、説明、シーズンID、メインジャンルIDが含まれる。
```sql
INSERT INTO program (created_at, program_title, description, season_id, main_genre_id)
VALUES 
(NOW(), 'Program 1', 'Program 1 Description', 1, 1),
(NOW(), 'Program 2', 'Program 2 Description', 2, 2),
(NOW(), 'Program 3', 'Program 3 Description', 1, 3),
(NOW(), 'Program 4', 'Program 4 Description', 2, 3)
;
```
<br>

- `series_mapping` テーブルへの追加: プログラムとシリーズのマッピングを追加。作成日時、プログラムID、シリーズIDが含まれる。
```sql
INSERT INTO series_mapping (created_at, program_id, series_id)
VALUES 
(NOW(), 1, 1),
(NOW(), 2, 2)
;
```
<br>

- `genre_mapping` テーブルへの追加: プログラムとジャンルのマッピングを追加。作成日時、プログラムID、ジャンルIDが含まれる。
```sql
INSERT INTO genre_mapping (created_at, program_id, genre_id)
VALUES 
(NOW(), 1, 1),
(NOW(), 2, 2),
(NOW(), 3, 3),
(NOW(), 4, 3)
;
```
<br>

- `episode` テーブルへの追加: 4つの新しいエピソードを追加。各エピソードには作成日時、エピソードタイトル、説明、再生時間、放送時間、視聴数、プログラムIDが含まれる。
```sql
INSERT INTO episode (created_at, episode_title, description, playtime, on_air, views, program_id)
VALUES 
(NOW(), 'Episode 1', 'Episode 1 Description', 60, NOW(), 1000, 1),
(NOW(), 'Episode 2', 'Episode 2 Description', 90, NOW(), 2000, 2),
(NOW(), 'Episode 3', 'Episode 3 Description', 45, NOW(), 3000, 3),
(NOW(), 'Episode 4', 'Episode 4 Description', 120, NOW(), 4000, 4)
;
```
<br>

- `channel` テーブルへの追加: 'Channel 1'と'Channel 2'という新しいチャンネルを追加。作成日時は現在の時刻。
```sql
INSERT INTO channel (created_at, channel_name)
VALUES (NOW(), 'Channel 1'), (NOW(), 'Channel 2')
;
```
<br>

- `schedule` テーブルへの追加: 2つの新しいスケジュールを追加。各スケジュールには作成日時、チャンネルID、開始時間、終了時間が含まれる。
```sql
INSERT INTO schedule (created_at, channel_id, start_time, end_time)
VALUES 
(NOW(), 1, NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR)),
(NOW(), 2, DATE_ADD(NOW(), INTERVAL 1 HOUR), DATE_ADD(NOW(), INTERVAL 2 HOUR))
;
```
<br>

- `broadcast` テーブルへの追加: 4つの新しい放送を追加。各放送には作成日時、エピソードID、スケジュールIDが含まれる。
```sql
INSERT INTO broadcast (created_at, episode_id, schedule_id)
VALUES 
(NOW(), 1, 1),
(NOW(), 2, 2),
(NOW(), 3, 1),
(NOW(), 4, 2)
;
```
<br>

- `metrics_marker_function` テーブルへの追加: 2つの新しいメトリクスマーカー関数を追加。各関数には作成日時、関数名、関数内容が含まれる。
```sql
INSERT INTO metrics_marker_function (created_at, function_name, function_content)
VALUES 
(NOW(), 'Metrics Function 1', 'Function Content 1'),
(NOW(), 'Metrics Function 2', 'Function Content 2')
;
```
<br>

- `broadcast_metrics`  テーブルへの追加: 2つの新しい放送メトリクスを追加。各放送メトリクスには作成日時、放送ID、メトリクスマーカー関数IDが含まれる。
```sql
INSERT INTO broadcast_metrics (created_at, broadcast_id, metrics_marker_function_id, metrics_value)
VALUES 
(NOW(), 1, 1, 123),
(NOW(), 2, 2, 456)
;
```
<br>
