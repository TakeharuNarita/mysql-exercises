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



CREATE TABLE channel (
    channel_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    channel_name VARCHAR(255) NOT NULL
);

CREATE TABLE genre (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE genre_mapping (
    genre_mapping_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE program (
    program_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    season_id INT NOT NULL,
    FOREIGN KEY (season_id) REFERENCES season(season_id)
);

CREATE TABLE schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    channel_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    FOREIGN KEY (channel_id) REFERENCES channel(channel_id)
);

CREATE TABLE season (
    season_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    season_name VARCHAR(255) NOT NULL
);

CREATE TABLE series (
    series_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    series_name VARCHAR(255) NOT NULL
);

CREATE TABLE series_mapping (
    series_mapping_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    program_id INT NOT NULL,
    series_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id),
    FOREIGN KEY (series_id) REFERENCES series(series_id)
);

CREATE TABLE episode (
    episode_id INT PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME NOT NULL,
    episode_title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    playtime INT NOT NULL,
    on_air DATETIME NOT NULL,
    views BIGINT,
    program_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES program(program_id)
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



mysqldump -u root -p internet_tv > database_backup.sql
