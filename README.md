# UI/UX 視覺設計懶人包 (UI-UX Plan SOP)

啟動 UI/UX 視覺設計懶人包 SOP (整合 a-plan 雙煞車、倒轉時光機、奧客測試、GSAP 高質感動畫規範與防當機黑名單)。
使用者輸入 `/ui-ux-plan` 時觸發，指引視覺風格匹配、配色方案、Google Fonts 選擇、GSAP 平滑微交互、Artifacts 假畫面試玩、極限破壞測試與設計系統持久化。

## ✨ 核心特色
1. 🗣️ **全白話溝通（麻瓜說書人模式）**：不講生硬名詞，用生活化比喻解說設計與 GSAP 動畫觀念。
2. 🎨 **UI UX Pro Max 數據庫支援**：自動配對 79 種 UI 風格、192 套配色與 74 組 Google Fonts。
3. 🎬 **GSAP 綠光高質感動畫規範**：
   - 物理動態微交互 (`power2.out`, `back.out(1.7)`)
   - ScrollTrigger 滾動登場 (`autoAlpha`)
   - 必然記憶體回收機制 (組件卸載時自動 `.revert()` / `.kill()`)
   - 支援 `prefers-reduced-motion` 無障礙減弱動畫
4. 🕹️ **雙預覽試玩機制 (Artifacts)**：先在聊天室產出可互動 HTML/GSAP 試玩，確認過關後才寫入專案。
5. 🛡️ **鋼鐵安全機制**：
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
