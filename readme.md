<!-- # mysql-exercises INTERNET_TV -->
# mysql-練習 INTERNET_TV

MySQLの学習を行う上でインターネットテレビのデータベース作成を行った記録です。

![itv.png](https://gyazo.com/ce5493d717bb65ed0c989b4f020549eb.png)


<ol>

## <li>テーブル設計</li>

<details>
  <summary>a. テーブル：series</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|series_id            |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|series_name          |VARCHAR(255)    |    |          |        |              |


  <br></text>

</details>
<br><details>
  <summary>b. テーブル：genre</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|genre_id             |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|genre_name           |VARCHAR(255)    |    |          |        |              |


  <br></text>

</details>
<br><details>
  <summary>c. テーブル：season</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|season_id            |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|season_name          |VARCHAR(255)    |    |          |        |              |


  <br></text>

</details>
<br><details>
  <summary>d. テーブル：program</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|program_id           |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|program_title        |VARCHAR(255)    |    |          |        |              |
|description          |TEXT            |    |          |        |              |
|season_id            |INT             |    |          |        |              |
|main_genre_id        |INT             |    |          |        |              |

- 外部キー制約：season_id に対して season(season_id)、main_genre_id に対して genre(genre_id) から設定


  <br></text>

</details>
<br><details>
  <summary>e. テーブル：episode</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|episode_id           |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|episode_title        |VARCHAR(255)    |    |          |        |              |
|description          |TEXT            |    |          |        |              |
|playtime             |INT             |    |          |        |              |
|on_air               |DATETIME        |    |          |        |              |
|views                |BIGINT          |    |          |0       |              |
|program_id           |INT             |    |          |        |              |

- 外部キー制約：program_id に対して program(program_id) から設定


  <br></text>

</details>
<br><details>
  <summary>f. テーブル：series_mapping</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|series_mapping_id    |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|program_id           |INT             |    |          |        |              |
|series_id            |INT             |    |          |        |              |

- 外部キー制約：program_id に対して program(program_id)、series_id に対して series(series_id) から設定


  <br></text>

</details>
<br><details>
  <summary>g. テーブル：genre_mapping</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|genre_mapping_id     |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|program_id           |INT             |    |          |        |              |
|genre_id             |INT             |    |          |        |              |

- 外部キー制約：program_id

 に対して program(program_id)、genre_id に対して genre(genre_id) から設定


  <br></text>

</details>
<br><details>
  <summary>h. テーブル：channel</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|channel_id           |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|channel_name         |VARCHAR(255)    |    |          |        |              |


  <br></text>

</details>
<br><details>
  <summary>i. テーブル：schedule</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|schedule_id          |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|channel_id           |INT             |    |          |        |              |
|start_time           |DATETIME        |    |          |        |              |
|end_time             |DATETIME        |    |          |        |              |

- 外部キー制約：channel_id に対して channel(channel_id) から設定


  <br></text>

</details>
<br><details>
  <summary>j. テーブル：metrics_marker_function</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|metrics_marker_function_id|INT        |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|function_name        |VARCHAR(255)    |    |          |        |              |
|function_content     |TEXT            |    |          |        |              |


  <br></text>

</details>
<br><details>
  <summary>k. テーブル：broadcast</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|broadcast_id         |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|episode_id           |INT             |    |          |        |              |
|schedule_id          |INT             |    |          |        |              |

- 外部キー制約：episode_id に対して episode(episode_id)、schedule_id に対して schedule(schedule_id) から設定


  <br></text>

</details>
<br><details>
  <summary>l. テーブル：broadcast_metrics</summary>

  <text><br>


|カラム名             |データ型        |NULL|キー      |初期値  |AUTO INCREMENT|
|:-:                  |:-:             |:-: |:-:       |:-:     |:-:           |
|broadcast_metrics_id |INT             |    |PRIMARY   |        |YES           |
|created_at           |DATETIME        |    |          |        |              |
|broadcast_id         |INT             |    |          |        |              |
|metrics_marker_function_id|INT        |    |          |        |              |

- 外部キー制約：broadcast_id に対して broadcast(broadcast_id)、metrics_marker_function_id に対して metrics_marker_function(metrics_marker_function_id) から設定


  <br></text>

</details>
<br>


## <li>手順のドキュメント</li>

[データベースの設計と操作手順について](./data_add_doc.md)

## <li>データの抽出</li>


<details>
  <summary>a. エピソード視聴数トップ3のエピソードタイトルと視聴数</summary>

  <text><br>

```sql
SELECT e.episode_title, e.views
  FROM episode e
 ORDER BY e.views DESC
 LIMIT 3
;
```

| episode_title | views     |
|-|-|
| ep3           | 999946789 |
| ep14          | 999733455 |
| ep8           | 999537708 |


  <br></text>

</details>
<br>
<details>
  <summary>b. エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数</summary>

  <text><br>

```sql
SELECT p.program_title AS Program_Title
     , e.episode_title AS Episode_Title
     , e.views AS View_Count
     , (
         SELECT COUNT(*)
           FROM program p2
          WHERE p2.season_id = p.season_id
       ) AS Total_season
     , (
         SELECT COUNT(*)
           FROM episode e2 
          WHERE e2.program_id = e.program_id
       ) AS Total_episode
     , (
         SELECT COUNT(*)+1
           FROM program p2
          WHERE p2.season_id = p.season_id AND p2.program_id < p.program_id
       ) AS Nth_season
     , (
         SELECT COUNT(*)+1
           FROM episode e2 
          WHERE e2.program_id = e.program_id AND e2.episode_id < e.episode_id
       ) AS Nth_episode
     , e.episode_title AS Episode_Title
     , e.views AS View_Count
  FROM episode e
  JOIN program p ON e.program_id = p.program_id
 ORDER BY e.views DESC
 LIMIT 3
;
```

| Program_Title                             | Episode_Title | View_Count | Total_season | Total_episode | Nth_season | Nth_episode | Episode_Title | View_Count |
|-|-|-|-|-|-|-|-|-|
| 素晴らしき世界 シーズン11                 | ep3           |  999946789 |           13 |            10 |         11 |           3 | ep3           |  999946789 |
| 夢見るピアノ シーズン2                    | ep14          |  999733455 |           14 |            14 |          2 |          14 | ep14          |  999733455 |
| スイートドリームス シーズン2              | ep8           |  999537708 |            6 |             9 |          2 |           8 | ep8           |  999537708 |

<!-- ```
mysql> SELECT * FROM program WHERE program_title LIKE '%夢見るピアノ シーズン%';
+------------+---------------------+-----------------------------------+-----------------------+-----------+---------------+
| program_id | created_at          | program_title                     | description           | season_id | main_genre_id |
+------------+---------------------+-----------------------------------+-----------------------+-----------+---------------+
|        243 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン1            | 番組説明です。        |        28 |            22 |
|        244 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン2            | 番組説明です。        |        28 |            22 |
|        245 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン3            | 番組説明です。        |        28 |            22 |
|        246 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン4            | 番組説明です。        |        28 |            22 |
|        247 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン5            | 番組説明です。        |        28 |            22 |
|        248 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン6            | 番組説明です。        |        28 |            22 |
|        249 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン7            | 番組説明です。        |        28 |            22 |
|        250 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン8            | 番組説明です。        |        28 |            22 |
|        251 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン9            | 番組説明です。        |        28 |            22 |
|        252 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン10           | 番組説明です。        |        28 |            22 |
|        253 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン11           | 番組説明です。        |        28 |            22 |
|        254 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン12           | 番組説明です。        |        28 |            22 |
|        255 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン13           | 番組説明です。        |        28 |            22 |
|        256 | 2023-05-18 13:07:15 | 夢見るピアノ シーズン14           | 番組説明です。        |        28 |            22 |
+------------+---------------------+-----------------------------------+-----------------------+-----------+---------------+
``` -->

  <br></text>

</details>
<br>
<details>
  <summary>c. 本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細</summary>

  <text><br>

```sql
SELECT ch.channel_name
     , s.start_time
     , TIME(s.end_time) AS End_time
     , (
         SELECT COUNT(*)+1
           FROM program p2
          WHERE p2.season_id = p.season_id AND p2.program_id < p.program_id
       ) AS Nth_season
     , (
         SELECT COUNT(*)+1
           FROM episode e2 
          WHERE e2.program_id = e.program_id AND e2.episode_id < e.episode_id
       ) AS Nth_episode
     , e.episode_title
     , e.description
  FROM channel ch
 INNER JOIN schedule s ON s.channel_id = ch.channel_id
 INNER JOIN broadcast b ON b.schedule_id = s.schedule_id
 INNER JOIN episode e ON e.episode_id = b.episode_id
 INNER JOIN program p ON p.program_id = e.program_id
 WHERE DATE(s.start_time) = CURDATE()
;

```

| channel_name | start_time          | End_time | Nth_season | Nth_episode | episode_title | description                    |
| ------------ | ------------------- | -------- | ---------- | ----------- | ------------- | ------------------------------ |
| ペット       | 2023-05-19 00:00:00 | 01:00:00 |         14 |           4 | ep4           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 01:00:00 | 02:00:00 |          1 |           4 | ep4           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 02:00:00 | 03:00:00 |          2 |           4 | ep4           | エピソード説明です。           |
| アニメ1      | 2023-05-19 03:00:00 | 04:00:00 |          3 |           4 | ep4           | エピソード説明です。           |
| アニメ2      | 2023-05-19 04:00:00 | 05:00:00 |          4 |           4 | ep4           | エピソード説明です。           |
| スポーツ     | 2023-05-19 05:00:00 | 06:00:00 |          5 |           4 | ep4           | エピソード説明です。           |
| ペット       | 2023-05-19 06:00:00 | 07:00:00 |          6 |           4 | ep4           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 07:00:00 | 08:00:00 |          7 |           4 | ep4           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 08:00:00 | 09:00:00 |          8 |           4 | ep4           | エピソード説明です。           |
| アニメ1      | 2023-05-19 09:00:00 | 10:00:00 |          9 |           4 | ep4           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 14:00:00 | 15:00:00 |          3 |           4 | ep4           | エピソード説明です。           |
| アニメ1      | 2023-05-19 15:00:00 | 16:00:00 |          4 |           4 | ep4           | エピソード説明です。           |
| アニメ2      | 2023-05-19 16:00:00 | 17:00:00 |          5 |           4 | ep4           | エピソード説明です。           |
| スポーツ     | 2023-05-19 17:00:00 | 18:00:00 |          6 |           4 | ep4           | エピソード説明です。           |
| ペット       | 2023-05-19 18:00:00 | 19:00:00 |          7 |           4 | ep4           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 19:00:00 | 20:00:00 |          8 |           4 | ep4           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 20:00:00 | 21:00:00 |          9 |           4 | ep4           | エピソード説明です。           |
| アニメ1      | 2023-05-19 21:00:00 | 22:00:00 |         10 |           4 | ep4           | エピソード説明です。           |
| アニメ2      | 2023-05-19 22:00:00 | 23:00:00 |         11 |           4 | ep4           | エピソード説明です。           |
| スポーツ     | 2023-05-19 23:00:00 | 00:00:00 |         12 |           4 | ep4           | エピソード説明です。           |
| ペット       | 2023-05-19 00:00:00 | 01:00:00 |          5 |           3 | ep3           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 01:00:00 | 02:00:00 |          6 |           3 | ep3           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 02:00:00 | 03:00:00 |          7 |           3 | ep3           | エピソード説明です。           |
| アニメ1      | 2023-05-19 03:00:00 | 04:00:00 |          1 |           3 | ep3           | エピソード説明です。           |
| アニメ2      | 2023-05-19 04:00:00 | 05:00:00 |          2 |           3 | ep3           | エピソード説明です。           |
| スポーツ     | 2023-05-19 05:00:00 | 06:00:00 |          3 |           3 | ep3           | エピソード説明です。           |
| ペット       | 2023-05-19 06:00:00 | 07:00:00 |          4 |           3 | ep3           | エピソード説明です。           |
| アニメ1      | 2023-05-19 09:00:00 | 10:00:00 |          7 |           3 | ep3           | エピソード説明です。           |
| アニメ2      | 2023-05-19 10:00:00 | 11:00:00 |          8 |           3 | ep3           | エピソード説明です。           |
| スポーツ     | 2023-05-19 11:00:00 | 12:00:00 |          9 |           3 | ep3           | エピソード説明です。           |
| ペット       | 2023-05-19 12:00:00 | 13:00:00 |         10 |           3 | ep3           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 13:00:00 | 14:00:00 |         11 |           3 | ep3           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 14:00:00 | 15:00:00 |         12 |           3 | ep3           | エピソード説明です。           |
| アニメ1      | 2023-05-19 15:00:00 | 16:00:00 |         13 |           3 | ep3           | エピソード説明です。           |
| アニメ2      | 2023-05-19 16:00:00 | 17:00:00 |         14 |           3 | ep3           | エピソード説明です。           |
| スポーツ     | 2023-05-19 17:00:00 | 18:00:00 |          1 |           3 | ep3           | エピソード説明です。           |
| ペット       | 2023-05-19 18:00:00 | 19:00:00 |          2 |           3 | ep3           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 19:00:00 | 20:00:00 |          3 |           3 | ep3           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 20:00:00 | 21:00:00 |          4 |           3 | ep3           | エピソード説明です。           |
| アニメ1      | 2023-05-19 21:00:00 | 22:00:00 |          5 |           3 | ep3           | エピソード説明です。           |
| アニメ2      | 2023-05-19 22:00:00 | 23:00:00 |          6 |           3 | ep3           | エピソード説明です。           |
| スポーツ     | 2023-05-19 23:00:00 | 00:00:00 |          7 |           3 | ep3           | エピソード説明です。           |
| ペット       | 2023-05-19 00:00:00 | 01:00:00 |         16 |           2 | ep2           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 01:00:00 | 02:00:00 |         17 |           2 | ep2           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 02:00:00 | 03:00:00 |          1 |           2 | ep2           | エピソード説明です。           |
| アニメ1      | 2023-05-19 03:00:00 | 04:00:00 |          2 |           2 | ep2           | エピソード説明です。           |
| アニメ2      | 2023-05-19 04:00:00 | 05:00:00 |          3 |           2 | ep2           | エピソード説明です。           |
| スポーツ     | 2023-05-19 05:00:00 | 06:00:00 |          4 |           2 | ep2           | エピソード説明です。           |
| ペット       | 2023-05-19 06:00:00 | 07:00:00 |          5 |           2 | ep2           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 07:00:00 | 08:00:00 |          6 |           2 | ep2           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 08:00:00 | 09:00:00 |          7 |           2 | ep2           | エピソード説明です。           |
| アニメ1      | 2023-05-19 09:00:00 | 10:00:00 |          8 |           2 | ep2           | エピソード説明です。           |
| アニメ2      | 2023-05-19 10:00:00 | 11:00:00 |          1 |           2 | ep2           | エピソード説明です。           |
| スポーツ     | 2023-05-19 11:00:00 | 12:00:00 |          1 |           2 | ep2           | エピソード説明です。           |
| ペット       | 2023-05-19 12:00:00 | 13:00:00 |          2 |           2 | ep2           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 13:00:00 | 14:00:00 |          3 |           2 | ep2           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 14:00:00 | 15:00:00 |          4 |           2 | ep2           | エピソード説明です。           |
| アニメ1      | 2023-05-19 15:00:00 | 16:00:00 |          5 |           2 | ep2           | エピソード説明です。           |
| アニメ2      | 2023-05-19 16:00:00 | 17:00:00 |          6 |           2 | ep2           | エピソード説明です。           |
| スポーツ     | 2023-05-19 17:00:00 | 18:00:00 |          7 |           2 | ep2           | エピソード説明です。           |
| ペット       | 2023-05-19 18:00:00 | 19:00:00 |          8 |           2 | ep2           | エピソード説明です。           |
| ドラマ1      | 2023-05-19 19:00:00 | 20:00:00 |          9 |           2 | ep2           | エピソード説明です。           |
| ドラマ2      | 2023-05-19 20:00:00 | 21:00:00 |         10 |           2 | ep2           | エピソード説明です。           |
| アニメ1      | 2023-05-19 21:00:00 | 22:00:00 |          1 |           2 | ep2           | エピソード説明です。           |
| アニメ2      | 2023-05-19 22:00:00 | 23:00:00 |          2 |           2 | ep2           | エピソード説明です。           |
| スポーツ     | 2023-05-19 23:00:00 | 00:00:00 |          3 |           2 | ep2           | エピソード説明です。           |



  <br></text>

</details>
<br>
<details>
  <summary>d. ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得</summary>

  <text><br>

```sql
SELECT s.start_time
     , s.end_time
     , COUNT(DISTINCT p.season_id) as seasons
     , COUNT(e.episode_id) as episodes
     , e.episode_title
     , e.description
  FROM channel ch
 INNER JOIN schedule s ON s.channel_id = ch.channel_id
 INNER JOIN broadcast b ON b.schedule_id = s.schedule_id
 INNER JOIN episode e ON e.episode_id = b.episode_id
 INNER JOIN program p ON p.program_id = e.program_id
 WHERE (ch.channel_name = 'ドラマ1' OR ch.channel_name = 'ドラマ2')  AND s.start_time BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
 GROUP BY s.start_time
        , s.end_time
        , e.episode_title
        , e.description
;
```

  <br></text>

</details>
<br>
<details>
  <summary>e. 直近一週間で最も見られた番組が知りたい。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得</summary>

  <text><br>

```sql
SELECT p.program_title
     , SUM(e.views) as total_views
  FROM program p
 INNER JOIN episode e ON e.program_id = p.program_id
 WHERE e.on_air BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
 GROUP BY p.program_title
 ORDER BY total_views DESC
 LIMIT 2
;
```

  <br></text>

</details>
<br>
<details>
  <summary>f. ジャンルごとの番組の視聴数ランキングを知りたい。番組の視聴数ランキングはエピソードの平均視聴数ランキングとする。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得</summary>

  <text><br>

```sql
SELECT g.genre_name
     , p.program_title
     , AVG(e.views) as avg_views
  FROM genre g
 INNER JOIN genre_mapping gm ON gm.genre_id = g.genre_id
 INNER JOIN program p ON p.program_id = gm.program_id
 INNER JOIN episode e ON e.program_id = p.program_id
 GROUP BY g.genre_name
        , p.program_title
 ORDER BY avg_views DESC
;
```

  <br></text>

</details>
<br>

## <li>反省</li>

  - エピソードの公開非公開を選択するカラムが必要
  - テーブル名やカラム名の命名規則が確立されていない
  - 

<ol>