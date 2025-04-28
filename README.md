# sei_list

## Description

- list_all.json: 全てのvideoId,publishedAt,titleのリスト(メンバーシップ限定を除く)
- list.json: `list_all.json`から雑談やゲーム配信のほとんどを取り除き、保存に適すると判断して作成したリスト
- list_music.json: MVやCoverを中心とした最小のリスト
- list_memberonly.json: メンバーシップ限定のリスト
- videoids.txt: `list.json`のvideoId、1行ずつのリスト
- videoids_music.txt: `list_music.json`のvideoId、1行ずつのリスト
- videoids_memberonly.txt: `list_memberonly.json`のvideoId、1行ずつのリスト
- script/download_videos.sh: yt-dlpを使用し`videoids.txt`にある動画等をダウンロードするシェルスクリプト
- script/download_chats.sh: yt-dlpを使用し`videoids.txt`にある動画等のチャット,コメントをダウンロードするシェルスクリプト
- script/download_thumbnails.sh: wgetを使用`videoids.txt`にある配信等のサムネイルをダウンロードするシェルスクリプト
- script/download_\*.sh類: 上記3つと用法は同じで、使用するvideoidsの違い

## Usage of Scripts

`download_\*.sh`類の使用方法を以下に説明します。

使用するスクリプトについては、各listを確認した上で消費ストレージ容量や掛かる時間を検討し吟味してください。
`videoids.txt`をカスタマイズすることで、ダウンロード対象を変更することも可能です。

注意: 作りが雑なので動画タイトルが長いとファイル名の長さ制限を突破して失敗します。ログを見て手作業でダウンロードし直しましたが、本来はスクリプトを修正した方が良いと思います。

### Requirements

- bash
- git
- yt-dlp
- ffmpeg
- wget
- 十分なストレージ容量

まず、このリポジトリをcloneします。WSLにて実行する場合、WSL内ではなくWindows上のディレクトリにて行うことをお勧めします。
```
git clone https://github.com/kenh0u/sei_list.git
```

### download_videos.sh

yt-dlpとffmpegをインストール (Ubuntuの場合のコマンド例)

```
sudo pipx install yt-dlp
sudo apt install ffmpeg
```

メンバーシップ限定配信アーカイブもダウンロードしたい場合、メンバーシップに加入した上で
Chrome拡張機能[Get cookies.txt LOCALLY](https://chrome.google.com/webstore/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc)
などを使用してYouTubeのCookieを抜き取り、`youtube.com_cookies.txt`として配置してください。

スクリプトを実行します。

```
./script/download_videos.sh
```

ファイルは`video`ディレクトリ以下、ログは`log/download_videos.log`に保存されます。

### download_chats.sh

スクリプトを実行します。

```
./download_chats.sh
```

ファイルは`chat`ディレクトリ以下、ログは`log/download_chats.log`に保存されます。

### download_thumbnails.sh

スクリプトを実行します。

```
./download_thumbnails.sh
```

ファイルは`thumbnail`ディレクトリ以下、ログは`log/download_thumbnails.log`に保存されます。
