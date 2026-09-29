# 🌀 3D Tooltip 微交互與高質感特效規範 (Extract from html5tooltips.js 現代化升級版)

本文件收錄 **5 大 3D 提示氣泡 (Tooltip) 微交互視覺** 與 **無障礙 (WAI-ARIA) 規範**。全數拋棄舊版獨立 JS 套件依賴，採用 **零套件依賴 (Zero-Dependency) 的純 Tailwind CSS + GSAP 3 物理緩動** 進行現代化實現。

---

## 🎨 一、 4 大預設視覺風格 (Tooltip Palettes)

在編寫 UI 時，根據專案品牌調性選擇對應的 Tooltip CSS 類別：

### 1. 深色玻璃擬態 (Dark Glass)
```html
<div class="absolute bottom-full mb-2 hidden group-hover:flex group-focus-visible:flex flex-col items-center z-50">
  <div class="px-3 py-1.5 rounded-lg text-xs font-medium text-slate-200 bg-slate-900/90 backdrop-blur-md border border-slate-700/50 shadow-xl shadow-black/40 whitespace-nowrap">
    提示文字內容
  </div>
  <div class="w-2 h-2 -mt-1 bg-slate-900/90 border-r border-b border-slate-700/50 rotate-45"></div>
</div>
```

### 2. 霓虹科技發光 (Neon Glow)
```html
<div class="absolute bottom-full mb-2 hidden group-hover:flex group-focus-visible:flex flex-col items-center z-50">
  <div class="px-3 py-1.5 rounded-lg text-xs font-bold text-cyan-300 bg-slate-950 border border-cyan-500/40 shadow-[0_0_15px_rgba(6,182,212,0.3)] whitespace-nowrap">
    ⚡ 即時同步中
  </div>
  <div class="w-2 h-2 -mt-1 bg-slate-950 border-r border-b border-cyan-500/40 rotate-45"></div>
</div>
```

---

## 🌀 二、 5 大 3D 登場動畫規範 (3D Animation Presets)

將容器加上 `perspective-1000` (或 `style="perspective: 1000px"`)，並對 Tooltip 元素賦予以下動畫類別：

### 1. 📂 3D 摺疊翻開 (Fold Effect) — *最推薦*
如同紙張沿著 X 軸向前翻開，立體感極強。
```html
<div class="relative group inline-block">
  <button aria-describedby="tooltip-fold" class="px-4 py-2 bg-indigo-600 text-white rounded-lg font-medium">
    懸停查看 (Fold)
  </button>
  
  <!-- 3D Fold Tooltip -->
  <div id="tooltip-fold" role="tooltip" 
       class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 pointer-events-none opacity-0 scale-95 origin-bottom transition-all duration-300 ease-[cubic-bezier(0.175,0.885,0.32,1.275)] group-hover:opacity-100 group-hover:scale-100 group-hover:-translate-y-1 group-focus-visible:opacity-100 group-focus-visible:scale-100 [transform:perspective(1000px)_rotateX(-30deg)] group-hover:[transform:perspective(1000px)_rotateX(0deg)] z-50">
    <div class="px-3 py-1.5 bg-slate-900 text-slate-100 text-xs font-semibold rounded-lg shadow-2xl border border-slate-800 whitespace-nowrap">
      3D 摺疊展開提示 ✨
    </div>
  </div>
</div>
```

### 2. 🌀 3D 微幅旋轉登場 (Roll / Spin Effect)
帶有微幅 Z/Y 軸旋轉與物理彈性。
```html
<div id="tooltip-spin" role="tooltip"
     class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 pointer-events-none opacity-0 origin-bottom-left transition-all duration-300 ease-out group-hover:opacity-100 group-hover:rotate-0 group-hover:scale-100 [transform:rotate(-12deg)_scale(0.85)] z-50">
  <div class="px-3 py-1.5 bg-purple-900/90 text-purple-200 text-xs font-semibold rounded-lg shadow-xl border border-purple-500/30 whitespace-nowrap">
    旋轉登場效果
  </div>
</div>
```

### 3. 🚀 視差滑入 (Slide Up / Down Effect)
帶有回彈手感的上滑登場。
```html
<div id="tooltip-slide" role="tooltip"
     class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 pointer-events-none opacity-0 translate-y-3 transition-all duration-250 ease-[cubic-bezier(0.34,1.56,0.64,1)] group-hover:opacity-100 group-hover:translate-y-0 z-50">
  <div class="px-3 py-1.5 bg-slate-900 text-white text-xs font-medium rounded-md shadow-lg border border-slate-800">
    平滑視差滑入
  </div>
</div>
```

### 4. 🔍 彈性縮放 (Scale / Pop Effect)
```html
<div id="tooltip-scale" role="tooltip"
     class="absolute bottom-full left-1/2 -translate-x-1/2 mb-2 pointer-events-none opacity-0 scale-75 origin-bottom transition-all duration-200 ease-out group-hover:opacity-100 group-hover:scale-100 z-50">
  <div class="px-3 py-1.5 bg-indigo-950 text-indigo-200 text-xs font-bold rounded-lg border border-indigo-500/40">
    彈簧縮放效果
  </div>
</div>
```

---

## ♿ 三、 無障礙 (WAI-ARIA) 鐵律清單

1. **觸發元素 mandatory 屬性**：
   * 觸發按鈕/圖示必須具備 `aria-describedby="[tooltip-id]"`。
2. **Tooltip 容器 mandatory 屬性**：
   * Tooltip 本體必須具備 `role="tooltip"` 以及對應的 `id="[tooltip-id]"`。
3. **雙重狀態顯示**：
   * 必須同時支援滑鼠移入 (`group-hover:`) 與 鍵盤 Focus (`group-focus-visible:`)，確保無障礙導覽順暢。
4. **指標穿透 (Pointer-Events)**：
   * 浮動提示框必須加上 `pointer-events-none`，避免擋住滑鼠對周圍按鈕的點擊操作。
