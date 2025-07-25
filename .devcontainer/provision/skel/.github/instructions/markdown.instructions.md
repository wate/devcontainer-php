---
description: Markdownファイル作成・編集指針
applyTo: '**/*.md'
---
Markdownファイル作成・編集指針
=========================

このプロジェクトのMarkdown文書は、EditorConfig、markdownlint、textlintの設定に基づいて作成し、  
一貫性のある高品質な技術文書を維持します。  

基本原則
-------------------------

- 文字コード: UTF-8
- 改行コード: LF（Unix系）
- インデント: スペース4文字
- 行末の空白: 削除しない（意図的な改行のため保持）
- ファイル末尾: 改行を入れる
- 見出しスタイル: h1とh2はsetext記法（下線長は25文字固定）、h3以降はatx記法
- 行の長さ: 最大120文字（コードブロックや表、見出しを含むすべてに適用）
- h1（最上位見出し）は文書内で1つのみ使用
- 同一セグメント内の同じレベルでの見出しの重複は禁止
- 裸のURLの使用を許可（リンクとして明示的に記述する必要はない）
- コードブロックの言語指定は任意だが、可読性向上のため可能な限り指定する
- YAMLフロントマターを含む文書では、適切なメタデータを記述する

具体的な指示
-------------------------

### 見出しの記述ルール

- h1とh2はsetext記法を使用
    - 下線の長さは必ず25文字固定
    - h1: `=`文字で下線を引く
    - h2: `-`文字で下線を引く
- h3以降はatx記法（`#`）を使用
- 見出しレベルは段階的に増やす（h1の次はh2、h2の次はh3）
- 見出しの上に1行の空行を入れる
- 見出しの下に1行の空行を入れる

### リストの記述ルール

- リストをネストする場合のインデントは4スペース
- 一貫したスタイルでリストを記述する
- 順序なしリスト: 一貫したマーカーを使用
- 順序ありリスト: 番号形式を統一

### 文書品質の確保

- 技術文書向けのルール（preset-ja-technical-writing）に準拠
    - 一文の長さ制限を守る
    - 冗長な表現を避ける
    - 自然な日本語表現を使用
    - 「ですます調」を基本とする（リスト内では「ですます調」を優先）
- 日本語の間隔ルール（preset-ja-spacing）に準拠
    - カタカナ語間の中黒または半角スペースを使用
    - 括弧周りにスペースを入れない
    - 全角文字間にスペースを入れない
    - 半角文字と全角文字の間にスペースを入れない（space: never設定）
    - 感嘆符や疑問符の後にスペースを入れる
    - コードブロック周辺にスペースを入れない
- AI文章向けルール（@textlint-ja/preset-ai-writing）に準拠
    - AIによる特徴的な記法や表現を避ける
- 日本語表記の統一ルール
    - 副詞は平仮名に統一（ja-hiragana-fukushi）
    - 形式名詞は平仮名に統一（ja-hiragana-keishikimeishi）
    - 補助動詞は平仮名に統一（ja-hiragana-hojodoushi）
    - 同義語の使い分け（@textlint-ja/no-synonyms）を適用

### AI記法の禁止事項

- 「～について説明します」「～を見ていきましょう」等の解説調の表現を避ける
- 「いかがでしたでしょうか」「まとめると」等のブログ的な記法を使用しない
- 「以下の点が重要です」「注意すべき点として」等の冗長な導入文を避ける
- 「皆さん」「読者の方」等の不特定多数を意識した表現を使用しない
- 過度な感嘆符や絵文字の使用を避ける
- 箇条書きの項目で「～すること」等の動詞の連続使用を避ける
- 「ぜひ」「きっと」「おそらく」等の推測や勧誘表現を過度に使用しない

### 用語統一ルール

- プロジェクト固有の用語集（docs/rules/glossary.yml）に従う
    - 「ベンダー」（ベンダーではない）
    - 「サーバー」（サーバーではない）
    - 「カテゴリー」（カテゴリーではない）
- 略語は正式名称で記述（docs/rules/abbreviations.yml）
    - 「スプレッドシート」（スプレッドシートではない）
    - 「パワーポイント」（パワーポイントではない）
- 固有名詞は公式表記を使用（docs/rules/names.yml）
    - OS: Linux、Debian、Ubuntu、AlmaLinux、Rocky Linux、Windows、Mac、Android、iOS
    - 言語: PHP、Node.js、Python、Ruby、JavaScript、TypeScript、Rust、Go、HTML、CSS、Sass
    - フォーマット: Markdown、reStructuredText、AsciiDoc、YAML、JSON、TOML
    - フレームワーク: jQuery、jQuery UI、Laravel、CakePHP、Symfony、Rails
    - ツール: Ansible、Terraform、Packer
    - サービス: WordPress、Redmine、Backlog、Jira、Confluence
    - ブラウザ: Firefox、Chrome、Edge
    - エディタ: VSCode、Vim、Emacs、PyCharm、WebStorm、PhpStorm、RubyMine、IntelliJ IDEA、NetBeans、Eclipse

### コードとリンクの記述

- コードブロックの言語指定は任意（fenced-code-language: false設定）
- 可能な限り適切な言語を指定して可読性を向上させる
- コードブロック周辺にスペースを入れない（ja-space-around-code: false設定）
- 裸のURLの使用を許可（no-bare-urls: false設定）
- リンクテキスト内にスペースを入れない
- 空のリンクは禁止
- リンクフラグメントは有効性を確認
- インラインコードのマークアップ内にスペースを入れない

### 文書構造の要件

- 行の長さは最大120文字（すべての要素に適用）
- ファイル末尾に単一の改行文字
- 不要な空行の連続は避ける（maximum: 1設定）
- 見出しは段階的に増やす（レベルをスキップしない）
- インラインHTMLの使用は制限し、必要な場合のみ適切な要素を使用
- 強調記法と太字記法のスタイルは一貫性を保つ
- 水平線のスタイルは一貫性を保つ

品質チェックのポイント
-------------------------

### markdownlintチェック項目

- 見出しレベルの段階的増加（MD001: heading-increment）
- setext記法とatx記法の適切な使用（MD003: heading-style）
    - h1とh2はsetext記法、h3以降はatx記法
    - setext記法の下線は25文字固定
- リストのインデント（MD007: ul-indent）
    - ネストする場合は4スペース
- 行の長さ120文字制限（MD013: line-length）
- 見出し周辺の空行（MD022: blanks-around-headers）
    - 見出しの上下に1行ずつ空行
- h1見出しの単一使用（MD025: single-title）
- 同一セグメント内の見出し重複回避（MD024: no-duplicate-heading）
    - siblings_onlyオプションでセグメント内のみチェック
- 裸のURL許可（MD034: no-bare-urls: false）
- コードブロック言語指定任意（MD040: fenced-code-language: false）

### textlintチェック項目

- 技術文書の表現品質（preset-ja-technical-writing）
    - 敬語の統一（preferInList: "ですます"）
- 日本語の間隔とスペーシング（preset-ja-spacing）
    - カタカナ語間の中黒または半角スペース
    - 括弧周りのスペース除去
    - 全角文字間のスペース除去
    - 半角と全角文字間のスペース除去（space: never）
    - 感嘆符・疑問符後のスペース
    - コード周辺のスペース除去
- 固有名詞と用語の統一（prh）
    - 用語集（glossary.yml）
    - 略語（abbreviations.yml）
    - 固有名詞（names.yml）
    - タイプミス（typo.yml）
- 日本語表記統一
    - 副詞の平仮名化（ja-hiragana-fukushi）
    - 形式名詞の平仮名化（ja-hiragana-keishikimeishi）
    - 補助動詞の平仮名化（ja-hiragana-hojodoushi）
- 同義語の使い分け（@textlint-ja/no-synonyms）
- AI文章向けルール（@textlint-ja/preset-ai-writing）
    - AI特有の表現パターンを検出・回避
- コメントフィルター（comments）でtextlint-disable等を認識

参考情報
-------------------------

- EditorConfigの設定ファイル: `.editorconfig`
- markdownlintの設定ファイル: `.markdownlint.yml`
- textlintの設定ファイル: `.textlintrc.yml`
- 用語統一ルール: `docs/rules/` ディレクトリ内の各設定ファイル
    - 用語集: `docs/rules/glossary.yml`
    - 略語: `docs/rules/abbreviations.yml`
    - 固有名詞: `docs/rules/names.yml`
    - タイプミス: `docs/rules/typo.yml`
- プロジェクト関連ドキュメント
    - コーディング規約: `docs/code_style.md`
    - プロジェクト概要: `docs/index.md`
    - 技術スタック: `docs/technology.md`
    - テスト方針: `docs/test_policy.md`
    - ディレクトリ構造: `docs/directory_structure.md`
