<!-- # mysql-exercises INTERNET_TV -->
# mysql-練習 INTERNET_TV

MySQLの学習を行う上でインターネットテレビのデータベース作成を行った記録です。

![itv.png](https://gyazo.com/bfbada0ccae21d0011a85b5dbbc666ea.png)


<ol>

## <li>テーブル設計</li>

## <li>手順のドキュメント</li>

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

  <br></text>

</details>
<br>
<details>
  <summary>b. エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数</summary>

  <text><br>

```sql
SELECT p.program_title
     , COUNT(DISTINCT p.season_id) as seasons
     , COUNT(e.episode_id) as episodes
     , e.episode_title
     , e.views
  FROM program p
 INNER JOIN episode e ON e.program_id = p.program_id
 GROUP BY p.program_id, e.episode_title, e.views
 ORDER BY e.views DESC
 LIMIT 3
;
```

  <br></text>

</details>
<br>
<details>
  <summary>c. 本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細</summary>

  <text><br>

```sql
SELECT ch.channel_name
     , s.start_time
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
 WHERE DATE(s.start_time) = CURDATE()
 GROUP BY ch.channel_name
        , s.start_time
        , s.end_time
        , e.episode_title
        , e.description
;
```

  <br></text>

</details>
<br>
<details>
  <summary>d. ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得</summary>

  <text><br>

```sql
SELECT s.start_time, s.end_time, COUNT(DISTINCT p.season_id) as seasons, COUNT(e.episode_id) as episodes, e.episode_title, e.description
FROM channel ch
INNER JOIN schedule s ON s.channel_id = ch.channel_id
INNER JOIN broadcast b ON b.schedule_id = s.schedule_id
INNER JOIN episode e ON e.episode_id = b.episode_id
INNER JOIN program p ON p.program_id = e.program_id
WHERE ch.channel_name = 'Drama' AND s.start_time BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
GROUP BY s.start_time, s.end_time, e.episode_title, e.description;
```

  <br></text>

</details>
<br>
<details>
  <summary>e. 直近一週間で最も見られた番組が知りたい。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得</summary>

  <text><br>

```sql
SELECT p.program_title, SUM(e.views) as total_views
FROM program p
INNER JOIN episode e ON e.program_id = p.program_id
WHERE e.on_air BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
GROUP BY p.program_title
ORDER BY total_views DESC
LIMIT 2;
```

  <br></text>

</details>
<br>
<details>
  <summary>f. ジャンルごとの番組の視聴数ランキングを知りたい。番組の視聴数ランキングはエピソードの平均視聴数ランキングとする。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得</summary>

  <text><br>

```sql
SELECT g.genre_name, p.program_title, AVG(e.views) as avg_views
FROM genre g
INNER JOIN genre_mapping gm ON gm.genre_id = g.genre_id
INNER JOIN program p ON p.program_id = gm.program_id
INNER JOIN episode e ON e.program_id = p.program_id
GROUP BY g.genre_name, p.program_title
ORDER BY avg_views DESC;
```

  <br></text>

</details>
<br>


<ol>