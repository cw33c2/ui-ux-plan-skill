# 《麻瓜也能懂的 UI/UX 視覺設計與 GSAP 動態美學手冊》 (UI-UX Plan SOP)

啟動 UI/UX 視覺設計懶人包 SOP (整合 a-plan 雙煞車、倒轉時光機、奧客測試、GSAP 高質感動畫規範、快速動態資產生成流水線與防當機黑名單)。
使用者輸入 `/ui-ux-plan` 時觸發，指引視覺風格匹配、配色方案、Google Fonts 選擇、GSAP 平滑微交互、快速動態資產流水線、Artifacts 假畫面試玩、極限破壞測試與設計系統持久化。

## ✨ 核心特色
1. 🗣️ **全白話溝通（麻瓜說書人模式）**：不講生硬名詞，用生活化比喻解說設計觀念。
2. 🎨 **UI UX Pro Max 數據庫支援**：自動配對 79 種 UI 風格、192 套配色與 74 組 Google Fonts。
3. ⚡ **快速動態資產生成三部曲 (Fast Media Asset Pipeline)**：
   - Step 1：[My Strict App](https://my-strict-app.vercel.app/) 生成圖片
   - Step 2：[Google Flow](https://flow.google.com/) 轉為 Flow 影片
   - Step 3：[Ezgif Video to GIF](https://ezgif.com/video-to-gif) 轉成網頁輕量 GIF
4. 🎬 **GSAP 綠光高質感動態手感三神煞**：
   - `pin: true` ➡️ 網頁停在原地不滑走，等動畫播完才繼續往下滑。
   - `end: '+=2000'` ➡️ 滾動手感控制器（想滑久一點改大 `+=3000`，輕輕滑完改小 `+=1200`）。
   - `scrub: 0.8` ➡️ 跑車級懸吊避震（給予 0.8 秒平滑吸附手感，避免滾輪卡卡）。
   - 必然記憶體回收機制 (組件卸載時自動 `.revert()` / `.kill()`)。
   - 支援 `prefers-reduced-motion` 無障礙減弱動畫。
5. 🕹️ **雙預覽試玩機制 (Artifacts)**：先在聊天室產出可互動 HTML/GSAP 試玩，確認過關後才寫入專案。
6. 🛡️ **鋼鐵安全機制**：
   - 🆘 `/wait-what` 求救煞車鍵
   - ⏪ `/rewind` 一鍵倒轉時光機 (`git reset`)
   - 🔍 `/zoom-out` 大局觀重整鍵
   - 💥 瘋狂奧客極限測試（200字長標題、320px 窄屏測試）
   - 🚫 二次跑版修復無效黑名單

## 🚀 使用方式
將 `SKILL.md` 放入全域技能目錄（例如 `~/.gemini/config/skills/ui-ux-plan/SKILL.md` 或 `~/.agents/skills/ui-ux-plan/SKILL.md`），隨後在對話框中輸入：
```
/ui-ux-plan
```
即可開始執行 6 大視覺設計 SOP 流程！

## 📄 授權條款
MIT License
