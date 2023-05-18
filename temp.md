ストア
新着
本日無料
アニメ
MLB
プレミアリーグ
ブンデスリーガ
バラエティ
恋愛番組
映画
ドラマ
スポーツ
ニュース
韓流・華流
K-POP
将棋
麻雀
HIPHOP
格闘
テレ朝見逃し
ドキュメンタリー
音楽

# インターネットTVテーブル一覧

## チャンネル

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| チャンネルID  |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| チャンネル名  |VARCHAR(255)  |    |1   |    |   |    |    |   |    |

必ずスケジュールテーブルにチャンネルIDが存在することを保証する。


## スケジュール

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| スケジュールID|INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| チャンネルID  |INT           |    |1   |    |   |    |    |   |1   |
| 放送開始at    |datetime      |    |1   |    |   |    |    |   |    |
| 放送終了at    |datetime      |    |1   |    |   |    |    |   |    |

必ずブロードキャストテーブルにスケジュールIDが存在することを保証する。


## ブロードキャスト

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| ブロードキャストID|INT       |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| エピソードID  |INT           |    |1   |    |   |    |    |   |1   |
| スケジュールID|INT           |    |1   |    |   |    |    |   |1   |

必ずブロードキャストマトリクステーブルにブロードキャストIDが存在することを保証する。


## エピソード

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

必ずプログラムテーブルにエピソードIDが存在することを保証する。


## プログラム

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| プログラムID  |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
|プログラムタイトル|VARCHAR(255)|   |1   |    |   |    |    |   |    |
| description   |text          |    |1   |    |   |    |    |   |    |
| シーズンID    |INT           |    |1   |    |   |    |    |   |1   |

必ずシーズンテーブルにプログラムIDが存在することを保証する。
必ずジャンルマッピングテーブルにプログラムIDが存在することを保証する。


## シーズン

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| シーズンID    |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| シーズン名    |VARCHAR(255)  |    |1   |    |   |    |    |   |    |


## シリーズマッピング

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
|シリーズマッピングID    |INT  |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| プログラムID  |INT           |    |1   |    |   |    |    |   |1   |
| シリーズID    |INT           |    |1   |    |   |    |    |   |1   |


## シリーズ

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| シリーズID    |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| シリーズ名    |VARCHAR(255)  |    |1   |    |   |    |    |   |    |


## ジャンルマッピング

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| ジャンルマッピングID|INT     |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| プログラムID  |INT           |    |1   |    |   |    |    |   |1   |
| ジャンルID    |INT           |    |1   |    |   |    |    |   |1   |



## ジャンル

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
| ジャンルID    |INT           |1   |1   |1   |   |    |1   |   |    |
| クリエイトat  |datetime      |    |1   |    |   |    |    |   |    |
| ジャンル名    |VARCHAR(255)  |    |1   |    |   |    |    |   |    |


## ブロードキャストメトリクス

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
|ブロードキャストメトリクスID|INT|1 |1   |1   |   |    |1   |   |    |
|クリエイトat   |datetime      |    |1   |    |   |    |    |   |    |
|ブロードキャストID|INT        |    |1   |    |   |    |    |   |1   |
|メトリクスマーカーファンクションID|INT||1|   |   |    |    |   |1   |


## メトリクスマーカーファンクション

| Column        | Datatipe     | PK | NN | UQ | B | ZF | AI | G | FK |
|-              |-             |:-: |:-: |:-: |:-:|:-: |:-: |:-:|:-: |
|メトリクスマーカーファンクションID|INT|1|1|1 |   |    |1   |   |    |
|クリエイトat   |datetime      |    |1   |    |   |    |    |   |    |
|ファンクション名|VARCHAR(255) |    |1   |    |   |    |    |   |    |
|ファンクション|text           |    |1   |    |   |    |    |   |    |



||データベースのテーブル設計に関連する略語例|
|-|-|
| PK | Primary Key（プライマリキー）。一意で、テーブルの各レコードを特定するために使用されます。|
| NN | Not Null（ヌル不可）。このフィールドが NULL 値を許可しないことを示します。|
| UQ | Unique（一意）。このフィールドの値がテーブル内で一意であることを示します。つまり、同じ値を持つ2つのレコードを持つことはできません。|
| B | Binary（バイナリ）。このフィールドがバイナリデータ（0と1のみ）を格納することを示します。|
| ZF | Zero Fill（ゼロ埋め）。数値フィールドが指定した長さになるようにゼロで埋められることを示します。たとえば、フィールドの定義が INT(5) ZEROFILL で値が 78 の場合、表示は 00078 になります。|
| AI | Auto Increment（自動インクリメント）。データベースが新しいレコードを追加するたびに自動的に増加する数値を格納するフィールドを示します。これは通常、プライマリキーとして使用されます。|
| G | Generated（生成された）。このフィールドの値が他のフィールドから自動的に生成されることを示します。これは、計算フィールドや自動タイムスタンプなどに使用されます。|
| FK | Foreign Key（外部キー）。他のテーブルのプライマリキーを参照するフィールドを指します。これはデータの一貫性を維持するために使用され、参照されるテーブルのプライマリキー値が存在しない値を外部キーフィールドに挿入することを防ぎます。また、外部キーが参照するプライマリキーの値が変更されるか削除されるときに、それに対応する動作（カスケード削除、カスケード更新など）を定義することもできます。|



| テーブル名 | 概要 |
|-|-|
| チャンネルテーブル |  このテーブルは各チャンネルの情報を保持します。各チャンネルは一意のID、作成日時、およびチャンネル名を持ちます。 |
| スケジュールテーブル |  このテーブルは各放送スケジュールの情報を保持します。各スケジュールは一意のID、作成日時、チャンネルID、放送開始時間、および放送終了時間を持ちます。 |
| ブロードキャストテーブル |  このテーブルは各放送の情報を保持します。各放送は一意のID、作成日時、エピソードID、およびスケジュールIDを持ちます。 |
| エピソードテーブル |  このテーブルは各エピソードの詳細情報を保持します。各エピソードは一意のID、作成日時、エピソードタイトル、説明、再生時間、オンエア時間、視聴回数、およびプログラムIDを持ちます。 |
| プログラムテーブル |  このテーブルは各プログラムの情報を保持します。各プログラムは一意のID、作成日時、プログラムタイトル、説明、およびシーズンIDを持ちます。 |
| シーズンテーブル |  このテーブルは各シーズンの情報を保持します。各シーズンは一意のID、作成日時、およびシーズン名を持ちます。 |
| シリーズマッピングテーブル |  このテーブルはプログラムとシリーズの間の関連性を保持します。各エントリは一意のID、作成日時、プログラムID、およびシリーズIDを持ちます。 |
| シリーズテーブル |  このテーブルは各シリーズの情報を保持します。各シリーズは一意のID、作成日時、およびシリーズ名を持ちます。 |
| ジャンルマッピングテーブル |  このテーブルはプログラムとジャンルの間の関連性を保持します。各エントリは一意のID、作成日時、プログラムID、およびジャンルIDを持ちます。 |
| ジャンルテーブル |  このテーブルは各ジャンルの情報を保持します。各ジャンルは一意のID、作成日時、およびジャンル名を持ちます。 |
| ブロードキャストメトリクステーブル |  このテーブルは各放送のメトリクス情報を保持します。各エントリは一意のID、作成日時、ブロードキャストID、およびメトリクスマーカーファンクションIDを持ちます。 |
| メトリクスマーカーファンクションテーブル |  このテーブルは各メトリクスマーカーファンクションの情報を保持します。各エントリは一意のID、作成日時、関数名、および関数を持ちます。 |


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
    FOREIGN KEY (season_id) REFERENCES season(season_id)
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
    FOREIGN KEY (program_id) REFERENCES program(program_id)
);

CREATE TABLE series_mapping (
    series_mapping_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_id INT NOT NULL,
    series_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    FOREIGN KEY (series_id) REFERENCES series(series_id)
);

CREATE TABLE genre_mapping (
    genre_mapping_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
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
    FOREIGN KEY (channel_id) REFERENCES channel(channel_id)
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
    FOREIGN KEY (episode_id) REFERENCES episode(episode_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(schedule_id)
);

CREATE TABLE broadcast_metrics (
    broadcast_metrics_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    broadcast_id INT NOT NULL,
    metrics_marker_function_id INT NOT NULL,
    FOREIGN KEY (broadcast_id) REFERENCES broadcast(broadcast_id),
    FOREIGN KEY (metrics_marker_function_id) REFERENCES metrics_marker_function(metrics_marker_function_id)
);


DBMSからデータのアウトプット
```
mysqldump -u root -p internet_tv > database_backup.sql
```


### 外部キー制約を満たしながらデータを関連付けるための順序

<ol>

<li>`series`テーブルにデータを追加。</li>

```sql
INSERT INTO series (created_at, series_name) VALUES (NOW(), 'シリーズ名');
```

<li>`genre`テーブルにデータを追加。</li>

```sql
INSERT INTO genre (created_at, genre_name) VALUES (NOW(), 'ジャンル名');
```

<li>`season`テーブルにデータを追加。</li>

```sql
INSERT INTO season (created_at, season_name) VALUES (NOW(), 'シーズン名');
```

<li>`program`テーブルにデータを追加。この際、関連するシーズンのIDが必要。</li>

```sql
INSERT INTO program (created_at, program_title, description, season_id) VALUES (NOW(), 'プログラムタイトル', '説明文', シーズンID);
```

<li>`episode`テーブルにデータを追加。この際、関連するプログラムのIDが必要。</li>

```sql
INSERT INTO episode (created_at, episode_title, description, playtime, on_air, program_id) VALUES (NOW(), 'エピソードタイトル', '説明文', プレイタイム, '放送日時', プログラムID);
```

<li>`series_mapping`テーブルにデータを追加。この際、関連するプログラムとシリーズのIDが必要。</li>

```sql
INSERT INTO series_mapping (created_at, program_id, series_id) VALUES (NOW(), プログラムID, シリーズID);
```

<li>`genre_mapping`テーブルにデータを追加。この際、関連するプログラムとジャンルのIDが必要。</li>

```sql
INSERT INTO genre_mapping (created_at, program_id, genre_id) VALUES (NOW(), プログラムID, ジャンルID);
```

<li>`channel`テーブルにデータを追加。</li>

```sql
INSERT INTO channel (created_at, channel_name) VALUES (NOW(), 'チャンネル名');
```

<li>`schedule`テーブルにデータを追加。この際、関連するチャンネルのIDが必要。</li>

```sql
INSERT INTO schedule (created_at, channel_id, start_time, end_time) VALUES (NOW(), チャンネルID, '開始時間', '終了時間');
```

<li>`metrics_marker_function`テーブルにデータを追加。</li>

```sql
INSERT INTO metrics_marker_function (created_at, function_name, function_content) VALUES (NOW(), '関数名', '関数内容');
```

<li>`broadcast`テーブルにデータを追加。この際、関連するエピソードとスケジュールのIDが必要。</li>

```sql
INSERT INTO broadcast (created_at, episode_id, schedule_id) VALUES (NOW(), エピソードID, スケジュールID);
```

<li>`broadcast_metrics`テーブルにデータを追加。この際、関連する放送とメトリクスマーカー関数のIDが必要。</li>

```sql
INSERT INTO broadcast_metrics (created_at, broadcast_id, metrics_marker_function_id) VALUES (NOW(), 放送ID, メトリクスマーカー関数ID);
```

</ol>


1. ストア
2. 新着
3. 本日無料
4. アニメ
5. MLB
6. プレミアリーグ
7. ブンデスリーガ
8. バラエティ
9. 恋愛番組
10. 映画
11. ドラマ
12. スポーツ
13. ニュース
14. 韓流・華流
15. K-POP
16. 将棋
17. 麻雀
18. HIPHOP
19. 格闘
20. テレ朝見逃し
21. ドキュメンタリー
22. 音楽

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

！ひかりの森: 11 (ドラマ)！
！風を追いかけて: 11 (ドラマ)！
！星空カフェ: 22 (音楽)！
！美食の旅路: 21 (ドキュメンタリー)！
INSERT
    INTO episode (created_at, episode_title, description, playtime, on_air, program_id)
  VALUES (NOW(), '！密着', '説明文', 40, 'アイドル生活: 4 (アニメ)', 23)
;


11
11
22
21
4
11
11
9
8
10
11
11
12
13
11
22
22
11
21
11
22
21
11
21
11
10
8
22
21
11
22
22
11
9
8
10
11
22
11
11
22
2
22
11
11
22
11
22
22
11
11
8
9
11
11
8
21
8
11
11


ひかりの森
風を追いかけて
星空カフェ
美食の旅路
密着！アイドル生活
海辺の物語
素晴らしき世界
恋するキッチン
ミッドナイト・トーク
ミステリーナイト
昼下がりの詩
フラワーガーデン
パワフルスポーツ
グローバルニュース
ハイテク探偵団
サンセットドライブ
トワイライトメロディー
ドキドキ冒険団
おいしいレシピ
雪のプリンセス
炎のダンス
未来予想図
ワンダーランド
かわいいペット
マジカルジャーニー
スリリングな夜
スパイシーライフ
夢見るピアノ
都市の風景
星降る夜に
アクアブルー
音楽の時間
トロピカルパラダイス
ロマンティック・エンカウンター
お笑いチャンピオン
ナイトウォーカーズ
マジックタイム
花と風の調べ
ファンタジーアイランド
旅する心
レインボーダンス
フレッシュモーニング
ビューティフル・ハーモニー
ハートフルストーリー
ドリームキャッチャー
スターライトシンフォニー
プレシャスメモリー
さわやかウィンド
音楽の海
フレンドリータウン
マジカルワールド
スマイル・デイ
ドキドキ・デート
スパークリング・モーメント
ローズガーデン
フレンズ・フォーエバー
シークレット・レシピ
ハッピーデイズ
スイートドリームス
ドリーム

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

VALUES \(NOW\(\), '(.+?)', '説明文', 30, '2023-04-20 18:00:00', (\d{1,3})\)

VALUES (NOW(), '夜明けの歌', '説明文', 30, '2023-04-20 18:00:00', 1)
VALUES (NOW(), '光と影のダンス', '説明文', 30, '2023-04-27 18:00:00', 1)
VALUES (NOW(), '森の囁き', '説明文', 30, '2023-05-04 18:00:00', 1)
VALUES (NOW(), '秘密の池', '説明文', 30, '2023-05-11 18:00:00', 1)
VALUES (NOW(), '風の旅人', '説明文', 45, '2023-04-21 20:00:00', 2)
VALUES (NOW(), '遥かなる山々', '説明文', 45, '2023-04-28 20:00:00', 2)
VALUES (NOW(), '星空の下で', '説明文', 50, '2023-04-22 22:00:00', 3)
VALUES (NOW(), '月明かりの会話', '説明文', 50, '2023-04-29 22:00:00', 3)
VALUES (NOW(), '大阪の美食', '説明文', 60, '2023-04-23 20:00:00', 4)
VALUES (NOW(), '京都の美食', '説明文', 60, '2023-04-30 20:00:00', 4)
VALUES (NOW(), '初ステージ', '説明文', 50, '2023-04-24 20:00:00', 5)
VALUES (NOW(), '努力の日々', '説明文', 50, '2023-05-01 20:00:00', 5)
VALUES (NOW(), '初恋の予感', '説明文', 50, '2023-05-08 20:00:00', 5)
VALUES (NOW(), 'ライブ前夜', '説明文', 50, '2023-05-15 20:00:00', 5)
VALUES (NOW(), '夢のステージ', '説明文', 50, '2023-05-22 20:00:00', 5)
VALUES (NOW(), '海辺の思い出', '説明文', 60, '2023-04-25 18:00:00', 6)
VALUES (NOW(), '夏の終わり', '説明文', 60, '2023-05-02 18:00:00', 6)
VALUES (NOW(), '秋の始まり', '説明文', 60, '2023-05-09 18:00:00', 6)
VALUES (NOW(), '冬の訪れ', '説明文', 60, '2023-05-16 18:00:00', 6)
VALUES (NOW(), '春の予感', '説明文', 60, '2023-05-23 18:00:00', 6)
VALUES (NOW(), '世界の驚き', '説明文', 45, '2023-04-26 19:00:00', 7)
VALUES (NOW(), '未知への探求', '説明文', 45, '2023-05-03 19:00:00', 7)
VALUES (NOW(), '人類の進歩', '説明文', 45, '2023-05-10 19:00:00', 7)
VALUES (NOW(), '文化の交流', '説明文', 45, '2023-05-17 19:00:00', 7)
VALUES (NOW(), '大自然の美しさ', '説明文', 45, '2023-05-24 19:00:00', 7)
VALUES (NOW(), '初恋のレシピ', '説明文', 40, '2023-04-26 21:00:00', 8)
VALUES (NOW(), '母の味', '説明文', 40, '2023-05-03 21:00:00', 8)
VALUES (NOW(), '秘密のスパイス', '説明文', 40, '2023-05-10 21:00:00', 8)
VALUES (NOW(), '伝統の味', '説明文', 40, '2023-05-17 21:00:00', 8)
VALUES (NOW(), '未来の食事', '説明文', 40, '2023-05-24 21:00:00', 8)
VALUES (NOW(), '深夜の対話', '説明文', 60, '2023-04-27 00:00:00', 9)
VALUES (NOW(), '未明の思索', '説明文', 60, '2023-05-04 00:00:00', 9)
VALUES (NOW(), '謎解きの時間', '説明文', 45, '2023-04-27 21:00:00', 10)
VALUES (NOW(), '暗闇の秘密', '説明文', 45, '2023-05-04 21:00:00', 10)
VALUES (NOW(), '太陽の下で', '説明文', 30, '2023-04-28 13:00:00', 11)
VALUES (NOW(), '春風の中で', '説明文', 30, '2023-05-05 13:00:00', 11)
VALUES (NOW(), '花々の美学', '説明文', 40, '2023-04-28 14:00:00', 12)
VALUES (NOW(), '緑の風景', '説明文', 40, '2023-05-05 14:00:00', 12)
VALUES (NOW(), '熱戦の舞台', '説明文', 90, '2023-04-28 19:00:00', 13)
VALUES (NOW(), '挑戦の瞬間', '説明文', 90, '2023-05-05 19:00:00', 13)
VALUES (NOW(), '世界の動き', '説明文', 30, '2023-04-29 20:00:00', 13)
VALUES (NOW(), '新たな局面', '説明文', 30, '2023-05-06 20:00:00', 13)
VALUES (NOW(), 'ep1', '説明文', 30, '2023-05-06 20:00:00', 14)
VALUES (NOW(), 'ep2', '説明文', 30, '2023-05-08 20:00:00', 14)
VALUES (NOW(), 'ep3', '説明文', 30, '2023-05-10 20:00:00', 14)
VALUES (NOW(), 'ep4', '説明文', 30, '2023-05-12 20:00:00', 14)
VALUES (NOW(), 'ep5', '説明文', 30, '2023-05-14 20:00:00', 14)
VALUES (NOW(), 'ep6', '説明文', 30, '2023-05-16 20:00:00', 14)
VALUES (NOW(), 'ep7', '説明文', 30, '2023-05-18 20:00:00', 14)
VALUES (NOW(), 'ep8', '説明文', 30, '2023-05-20 20:00:00', 14)
VALUES (NOW(), 'ep9', '説明文', 30, '2023-05-22 20:00:00', 14)
VALUES (NOW(), 'ep1', '説明文', 30, '2023-05-22 20:00:00', 15)
VALUES (NOW(), 'ep2', '説明文', 30, '2023-06-12 20:00:00', 15)
VALUES (NOW(), 'ep3', '説明文', 30, '2023-06-22 20:00:00', 15)
VALUES (NOW(), 'ep4', '説明文', 30, '2023-07-12 20:00:00', 15)
VALUES (NOW(), 'ep5', '説明文', 30, '2023-07-22 20:00:00', 15)
VALUES (NOW(), 'ep6', '説明文', 30, '2023-08-12 20:00:00', 15)
VALUES (NOW(), 'ep7', '説明文', 30, '2023-08-22 20:00:00', 15)
VALUES (NOW(), 'ep8', '説明文', 30, '2023-09-12 20:00:00', 15)
VALUES (NOW(), 'ep9', '説明文', 30, '2023-09-22 20:00:00', 15)
VALUES (NOW(), 'ep10', '説明文', 30, '2023-10-16 20:00:00', 15)
VALUES (NOW(), 'ep11', '説明文', 30, '2023-10-26 20:00:00', 15)
VALUES (NOW(), 'ep12', '説明文', 30, '2023-11-16 20:00:00', 15)
VALUES (NOW(), 'ep13', '説明文', 30, '2023-11-26 20:00:00', 15)
VALUES (NOW(), 'ep14', '説明文', 30, '2023-12-16 20:00:00', 15)
VALUES (NOW(), '夕暮れのドライブ', '説明文', 60, '2023-04-30 18:00:00', 16)
VALUES (NOW(), '星空下のドライブ', '説明文', 60, '2023-05-07 18:00:00', 16)
VALUES (NOW(), '夜の調べ', '説明文', 50, '2023-04-30 22:00:00', 17)
VALUES (NOW(), '夜明け前の旋律', '説明文', 50, '2023-05-07 22:00:00', 17)
VALUES (NOW(), '冒険への招待', '説明文', 40, '2023-04-29 16:00:00', 18)
VALUES (NOW(), '新たなる挑戦', '説明文', 40, '2023-05-06 16:00:00', 18)
VALUES (NOW(), '美味しいレシピの秘密', '説明文', 30, '2023-05-13 19:00:00', 19)
VALUES (NOW(), '冬の料理特集', '説明文', 30, '2023-05-20 19:00:00', 19)
VALUES (NOW(), '雪のプリンセスの目覚め', '説明文', 45, '2023-05-14 20:00:00', 20)
VALUES (NOW(), '冬の王国の冒険', '説明文', 45, '2023-05-21 20:00:00', 20)
VALUES (NOW(), '炎のダンスチャレンジ', '説明文', 60, '2023-05-13 21:00:00', 21)
VALUES (NOW(), 'ダンスバトル決定戦', '説明文', 60, '2023-05-20 21:00:00', 21)
VALUES (NOW(), '未来の可能性', '説明文', 50, '2023-05-14 22:00:00', 22)
VALUES (NOW(), '技術の進化', '説明文', 50, '2023-05-21 22:00:00', 22)
VALUES (NOW(), 'ワンダーランドの旅', '説明文', 40, '2023-05-13 16:00:00', 23)
VALUES (NOW(), '不思議な世界の探求', '説明文', 40, '2023-05-20 16:00:00', 23)
