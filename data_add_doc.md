
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

# 本データベースの設計と操作手順について

## 目次

1. [データベースの設計と構築](#1-データベースの設計と構築)
    1. [データベースの設計](#11-データベースの設計)
    2. [データベースの構築](#12-データベースの構築)
2. [テーブルの作成](#2-テーブルの作成)
3. [データの登録](#3-データの登録)

## 1. データベースの設計と構築

### 1.1. データベースの設計

### 1.2. データベースの構築

<br>

## 2. テーブルの作成

<br>

## 3. データの登録

<br>


INSERT INTO series (created_at, series_name) VALUES (NOW(), 'シリーズ名');
INSERT INTO genre (created_at, genre_name) VALUES (NOW(), 'ジャンル名');
INSERT INTO season (created_at, season_name) VALUES (NOW(), 'シーズン名');
INSERT INTO program (created_at, program_title, description, season_id) VALUES (NOW(), 'プログラムタイトル', '説明文', シーズンID);
INSERT INTO episode (created_at, episode_title, description, playtime, on_air, program_id) VALUES (NOW(), 'エピソードタイトル', '説明文', プレイタイム, '放送日時', プログラムID);
INSERT INTO series_mapping (created_at, program_id, series_id) VALUES (NOW(), プログラムID, シリーズID);
INSERT INTO genre_mapping (created_at, program_id, genre_id) VALUES (NOW(), プログラムID, ジャンルID);
INSERT INTO channel (created_at, channel_name) VALUES (NOW(), 'チャンネル名');
INSERT INTO schedule (created_at, channel_id, start_time, end_time) VALUES (NOW(), チャンネルID, '開始時間', '終了時間');
INSERT INTO metrics_marker_function (created_at, function_name, function_content) VALUES (NOW(), '関数名', '関数内容');
INSERT INTO broadcast (created_at, episode_id, schedule_id) VALUES (NOW(), エピソードID, スケジュールID);
INSERT INTO broadcast_metrics (created_at, broadcast_id, metrics_marker_function_id) VALUES (NOW(), 放送ID, メトリクスマーカー関数ID);