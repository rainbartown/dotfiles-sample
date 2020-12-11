#!/bin/sh


# シンボリックリンクを作成
__ln() {(
    # リンクがすでに存在すれば削除
    [ -L "$2" ] && unlink "$2"

    # シンボリックリンクを作成
    ln -s "$1" "$2" && echo "ln: $1 -> $2" >&2
)}


# シンボリックリンクを削除
__unlink() {(
    unlink "$1" && echo "unlink: \"$1\""
)}


# ディレクトリを再帰的に作成
__mkdir() {(
    [ ! -e "$1" ] && mkdir -p "$1" && echo "mkdir: \"$1\"" >&2
)}


# linklist.txtのコメントを削除
__remove_linklist_comment() {(
    # '#'以降と空行を削除
    sed -e 's/\s*#.*//' \
        -e '/^\s*$/d' \
        $1
)}
