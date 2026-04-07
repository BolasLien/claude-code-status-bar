# claude-code-status-bar — 上架 GitHub 計劃

## 目標

將 Claude Code statusline 設定打包成一個可分享的 GitHub repo，讓其他人能快速安裝使用。

## 決策

- 授權：MIT
- Repo：公開 `bolaslien/claude-code-status-bar`
- README：英文主體，頂部放 `README.zh-TW.md` 中文版連結
- statusline 格式：方案 B（Ctx 用 bar，額度用帶色數字）

## 檔案結構

```
claude-code-status-bar/
├── statusline.sh          # 主要腳本
├── install.sh             # 一鍵安裝腳本
├── README.md              # 英文使用說明
├── README.zh-TW.md        # 繁體中文使用說明
├── LICENSE                # MIT 授權
└── PLAN.md                # 本計劃（可上架後移除）
```

## 待辦事項

### 1. 準備腳本
- [ ] 將 ~/.claude/statusline.sh 複製到 repo
- [ ] 確認腳本路徑不寫死，改用相對路徑或變數

### 2. 安裝腳本 (install.sh)
- [ ] 自動複製 statusline.sh 到 ~/.claude/
- [ ] 自動加入 settings.json 的 statusLine 設定
- [ ] 設定執行權限
- [ ] 檢查 jq 是否已安裝，未安裝則提示

### 3. README.md（英文）
- [ ] 頂部放中文版連結
- [ ] 功能說明（顯示哪些資訊）
- [ ] 效果示意（ASCII 範例）
- [ ] 安裝方式（一鍵 & 手動）
- [ ] 自訂說明（如何調整顏色門檻、欄位）
- [ ] 相依性（jq）

### 4. README.zh-TW.md（中文）
- [ ] 與英文版內容對應的繁體中文版

### 5. LICENSE
- [ ] MIT 授權檔案

### 6. 初始化 & 上架
- [ ] git init
- [ ] 建立 .gitignore
- [ ] 初始 commit
- [ ] 建立 GitHub repo
- [ ] push
