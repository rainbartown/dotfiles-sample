# dotfiles のサンプルリポジトリ


## リンク作成とリンク削除

リンク作成

```sh
cd dotfiles-sample/script
./link.sh
```

リンク削除

```sh
cd dotfiles-sample/script
./unlink.sh
```


## ディレクトリ構造

```
├── dotfiles  # 設定をまとめるディレクトリ
│   │   # 以下はOSごとのシンボリックリンクのリスト
│   ├── linklist.Darwin.txt     # macOS向けシンボリックリンクのリスト
│   ├── linklist.Linux.txt      # Linux向けシンボリックリンクのリスト
│   ├── linklist.Unix.txt       # Unix系OS向けシンボリックリンクのリスト
│   │   # 以下はソフトウェアごとの設定
│   ├── vim
│   │   └── .vim
│   │       └── ...
│   ├── vscode
│   │   └── Code
│   │       └── User
│   │           ├── locale.json
│   │           └── settings.json
│   └── zsh
│       ├── .zsh.d
│       │   └── ...
│       └── .zshenv
└── scripts         # リンク作成等のスクリプトをまとめるディレクトリ
    ├── common.sh   # 共有モジュール
    ├── link.sh     # リンク作成スクリプト
    └── unlink.sh   # リンク削除スクリプト
```


## シンボリックリンクのリスト

### リストファイルの読み込み
- `linklist.Unix.txt` はUnix系OSで読み込まれる。
- `linklist.<uname>.txt` は `uname` コマンドの結果が `<uname>` と一致する場合に読み込まれる。
    - 例: Linuxは `linklist.Linux.txt` 、macOSは `linklist.Darwin.txt` が読み込まれる。

### リストファイルの書き方

- 各行は空白で区切られた2つのフィールド
    - 1つめはターゲット（ `dotfiles` 内のパス）
    - 2つめはリンクのパス
        - `~` や環境変数が利用可能
- `#` 以降や空行は無視される
- 不要な設定は `script/link.sh` の実行前に `#` でコメントアウトすること

#### 設定例

- LinuxとmacOSでの利用例
- vimとzshの設定は両OSで同じパスに展開
- Visual Studio Codeの設定はそれぞれのOSで異なるパスに展開

```sh
# linklist.Unix.txt

# vim
vim/.vim                ${HOME}/.vim

# zsh
zsh/.zsh.d              ${HOME}/.zsh.d
zsh/.zshenv             ${HOME}/.zshenv
```

```sh
# linklist.Linux.txt

# Visual Studio Code
vscode/Code/User/settings.json      ${HOME}/.config/Code/User/settings.json
vscode/Code/User/keybindings.json   ${HOME}/.config/Code/User/keybindings.json
vscode/Code/User/locale.json        ${HOME}/.config/Code/User/locale.json
vscode/Code/User/snippets           ${HOME}/.config/Code/User/snippets
```

```sh
# linklist.Darwin.txt

# Visual Studio Code
vscode/Code/User/settings.json      ${HOME}/Library/ApplicationSupport/Code/User/settings.json
vscode/Code/User/keybindings.json   ${HOME}/Library/ApplicationSupport/Code/User/keybindings.json
vscode/Code/User/locale.json        ${HOME}/Library/ApplicationSupport/Code/User/locale.json
vscode/Code/User/snippets           ${HOME}/Library/ApplicationSupport/Code/User/snippets
```
