# 📊 D3.js 數據視覺化與 Effective-HTML 高階原型規範 (Extract from D3.js & plannotator/effective-html)

本文件整合 **D3.js 數據視覺化圖表繪製規範** 與 **plannotator/effective-html 高保真原型與架構圖 (Diagrams & Prototypes) 規範**。全數採用單一檔案 (Self-contained) 輕量架構，供 `ui-ux-plan` 技能於產出 HTML Artifacts 試玩畫面時調用。

---

## 📊 一、 D3.js 高階數據視覺化規範 (Data-Driven Visualizations)

當 UI 畫面需要展示複雜數據流、關聯圖、關係樹或動態圖表時，使用 `D3.js v7` (CDN 引用) 進行數據綁定與 SVG 渲染。

### 1. 引用規範 (CDN)
```html
<script src="https://d3js.org/d3.v7.min.min.js"></script>
```

### 2. D3.js 關係網絡圖 (Force-Directed Graph) 範例模板
用於展示系統架構、團隊關係或數據流向：
```html
<div id="d3-network-container" class="w-full h-[400px] bg-slate-900/50 rounded-2xl border border-slate-800 relative overflow-hidden"></div>

<script>
document.addEventListener('DOMContentLoaded', () => {
  const data = {
    nodes: [{id: "Core"}, {id: "API"}, {id: "DB"}, {id: "Auth"}, {id: "UI"}],
    links: [
      {source: "UI", target: "API"},
      {source: "API", target: "Core"},
      {source: "API", target: "Auth"},
      {source: "Core", target: "DB"}
    ]
  };

  const container = document.getElementById('d3-network-container');
  const width = container.clientWidth;
  const height = container.clientHeight;

  const svg = d3.select("#d3-network-container")
    .append("svg")
    .attr("width", width)
    .attr("height", height);

  const simulation = d3.forceSimulation(data.nodes)
    .force("link", d3.forceLink(data.links).id(d => d.id).distance(100))
    .force("charge", d3.forceManyBody().strength(-300))
    .force("center", d3.forceCenter(width / 2, height / 2));

  const link = svg.append("g")
    .selectAll("line")
    .data(data.links)
    .join("line")
    .attr("stroke", "#475569")
    .attr("stroke-width", 2);

  const node = svg.append("g")
    .selectAll("circle")
    .data(data.nodes)
    .join("circle")
    .attr("r", 12)
    .attr("fill", "#6366f1")
    .attr("stroke", "#818cf8")
    .attr("stroke-width", 2);

  simulation.on("tick", () => {
    link
      .attr("x1", d => d.source.x)
      .attr("y1", d => d.source.y)
      .attr("x2", d => d.target.x)
      .attr("y2", d => d.target.y);

    node
      .attr("cx", d => d.x)
      .attr("cy", d => d.y);
  });
});
</script>
```

---

## 🎨 二、 Effective-HTML 高保真原型與架構圖規範 (Prototypes & Diagrams)

來自 `plannotator/effective-html` 核心原則：產出的 HTML Artifacts 必須是 **獨立、完整、視覺高級且支援互動 (Self-contained, Interactive, Visually Rich)**。

### 1. 單檔完整性原則 (Self-Contained Fat Artifacts)
* **零依賴建置步驟**：HTML 檔案必須能在瀏覽器中直接開啟，樣式使用 Tailwind CSS (CDN)，圖示使用 SVG，互動使用原生 JS 或 GSAP。
* **Mock Data 內聚**：所有測試數據直接內建於頁面腳本中，確保畫面開啟時即有豐富真實的內容呈現。

### 2. 互動式 Wireframe / Prototype 規範
* ** State 狀態切換**：原型頁面應提供 Tab 切換、Modal 彈窗開合、Hover 狀態，允許使用者像操作真實 App 一樣點擊試玩。
* **卡片層級 (Visual Hierarchy)**：
  * 使用深淺顏色區分資訊層級（例如 `bg-slate-950` 背景 ➔ `bg-slate-900` 卡片 ➔ `bg-slate-800` Hover 態）。
  * 關鍵指標使用 Large KPI 樣式呈現。

### 3. HTML 現代流程圖 (HTML Diagram) 範例
避免使用死板的圖片，改用純 HTML/Tailwind CSS 的現代流程卡片：
```html
<div class="flex flex-col md:flex-row items-center justify-between gap-4 p-6 bg-slate-900 rounded-2xl border border-slate-800">
  <div class="flex-1 p-4 bg-slate-800/60 rounded-xl border border-slate-700/50 text-center">
    <div class="text-xs text-indigo-400 font-bold mb-1">STEP 01</div>
    <div class="font-bold text-white text-sm">數據輸入</div>
  </div>
  <div class="text-slate-500 font-bold text-lg hidden md:block">➔</div>
  <div class="flex-1 p-4 bg-slate-800/60 rounded-xl border border-indigo-500/30 text-center shadow-lg shadow-indigo-500/10">
    <div class="text-xs text-purple-400 font-bold mb-1">STEP 02</div>
    <div class="font-bold text-white text-sm">D3.js / AI 處理</div>
  </div>
  <div class="text-slate-500 font-bold text-lg hidden md:block">➔</div>
  <div class="flex-1 p-4 bg-slate-800/60 rounded-xl border border-slate-700/50 text-center">
    <div class="text-xs text-emerald-400 font-bold mb-1">STEP 03</div>
    <div class="font-bold text-white text-sm">高階視覺呈現</div>
  </div>
</div>
```
