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
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ひかりの森', '説明文', 1)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '風を追いかけて', '説明文', 2)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '星空カフェ', '説明文', 3)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '美食の旅路', '説明文', 4)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '密着！アイドル生活', '説明文', 5)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '海辺の物語', '説明文', 6)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '素晴らしき世界', '説明文', 7)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '恋するキッチン', '説明文', 8)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ミッドナイト・トーク', '説明文', 9)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ミステリーナイト', '説明文', 10)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '昼下がりの詩', '説明文', 11)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'フラワーガーデン', '説明文', 12)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'パワフルスポーツ', '説明文', 13)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'グローバルニュース', '説明文', 14)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ハイテク探偵団', '説明文', 15)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'サンセットドライブ', '説明文', 16)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'トワイライトメロディー', '説明文', 17)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ドキドキ冒険団', '説明文', 18)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'おいしいレシピ', '説明文', 19)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '雪のプリンセス', '説明文', 20)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '炎のダンス', '説明文', 21)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '未来予想図', '説明文', 22)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ワンダーランド', '説明文', 23)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'かわいいペット', '説明文', 24)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'マジカルジャーニー', '説明文', 25)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'スリリングな夜', '説明文', 26)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'スパイシーライフ', '説明文', 27)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '夢見るピアノ', '説明文', 28)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '都市の風景', '説明文', 29)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '星降る夜に', '説明文', 30)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'アクアブルー', '説明文', 31)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '音楽の時間', '説明文', 32)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'トロピカルパラダイス', '説明文', 33)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ロマンティック・エンカウンター', '説明文', 34)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'お笑いチャンピオン', '説明文', 35)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ナイトウォーカーズ', '説明文', 36)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'マジックタイム', '説明文', 37)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '花と風の調べ', '説明文', 38)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ファンタジーアイランド', '説明文', 39)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '旅する心', '説明文', 40)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'レインボーダンス', '説明文', 41)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'フレッシュモーニング', '説明文', 42)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ビューティフル・ハーモニー', '説明文', 43)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ハートフルストーリー', '説明文', 44)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ドリームキャッチャー', '説明文', 45)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'スターライトシンフォニー', '説明文', 46)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'プレシャスメモリー', '説明文', 47)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'さわやかウィンド', '説明文', 48)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), '音楽の海', '説明文', 49)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'フレンドリータウン', '説明文', 50)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'マジカルワールド', '説明文', 51)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'スマイル・デイ', '説明文', 52)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ドキドキ・デート', '説明文', 53)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'スパークリング・モーメント', '説明文', 54)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ローズガーデン', '説明文', 55)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'フレンズ・フォーエバー', '説明文', 56)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'シークレット・レシピ', '説明文', 57)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ハッピーデイズ', '説明文', 58)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'スイートドリームス', '説明文', 59)
;
INSERT
    INTO program (created_at, program_title, description, season_id)
  VALUES (NOW(), 'ドリーム', '説明文', 60)
;

ひかりの森: 11 (ドラマ)
風を追いかけて: 11 (ドラマ)
星空カフェ: 22 (音楽)
美食の旅路: 21 (ドキュメンタリー)
密着！アイドル生活: 4 (アニメ)
海辺の物語: 11 (ドラマ)
素晴らしき世界: 11 (ドラマ)
恋するキッチン: 9 (恋愛番組)
ミッドナイト・トーク: 8 (バラエティ)
ミステリーナイト: 10 (映画)
昼下がりの詩: 11 (ドラマ)
フラワーガーデン: 11 (ドラマ)
パワフルスポーツ: 12 (スポーツ)
グローバルニュース: 13 (ニュース)
ハイテク探偵団: 11 (ドラマ)
サンセットドライブ: 22 (音楽)
トワイライトメロディー: 22 (音楽)
ドキドキ冒険団: 11 (ドラマ)
おいしいレシピ: 21 (ドキュメンタリー)
雪のプリンセス: 11 (ドラマ)
炎のダンス: 22 (音楽)
未来予想図: 21 (ドキュメンタリー)
ワンダーランド: 11 (ドラマ)
かわいいペット: 21 (ドキュメンタリー)
マジカルジャーニー: 11 (ドラマ)
スリリングな夜: 10 (映画)
スパイシーライフ: 8 (バラエティ)
夢見るピアノ: 22 (音楽)
都市の風景: 21 (ドキュメンタリー)
星降る夜に: 11 (ドラマ)
アクアブルー: 22 (音楽)
音楽の時間: 22 (音楽)
トロピカルパラダイス: 11 (ドラマ)
ロマンティック・エンカウンター: 9 (恋愛番組)
お笑いチャンピオン: 8 (バラエティ)
ナイトウォーカーズ: 10 (映画)
マジックタイム: 11 (ドラマ)
花と風の調べ: 22 (音楽)
ファンタジーアイランド: 11 (ドラマ)
旅する心: 11 (ドラマ)
レインボーダンス: 22 (音楽)
フレッシュモーニング: 2 (新着)
ビューティフル・ハーモニー: 22 (音楽)
ハートフルストーリー: 11 (ドラマ)
ドリームキャッチャー: 11 (ドラマ)
スターライトシンフォニー: 22 (音楽)
プレシャスメモリー: 11 (ドラマ)
さわやかウィンド: 22 (音楽)
音楽の海: 22 (音楽)
フレンドリータウン: 11 (ドラマ)
マジカルワールド: 11 (ドラマ)
スマイル・デイ: 8 (バラエティ)
ドキドキ・デート: 9 (恋愛番組)
スパークリング・モーメント: 11 (ドラマ)
ローズガーデン: 11 (ドラマ)
フレンズ・フォーエバー: 8 (バラエティ)
シークレット・レシピ: 21 (ドキュメンタリー)
ハッピーデイズ: 8 (バラエティ)
スイートドリームス: 11 (ドラマ)
ドリーム: 11 (ドラマ)