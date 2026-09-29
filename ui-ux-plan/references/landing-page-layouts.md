# 🏛️ Landing Page 4 大經典佈局資產庫 (提取自 Designmodo 現代化升級版)

本文件收錄 4 大經典一頁式 Landing Page 佈局結構，全面剔除舊版 jQuery 依賴，採用 **Tailwind CSS + GSAP 3 (ScrollTrigger)** 進行現代化重構，供 `ui-ux-plan` 技能於設計與生成 HTML Artifacts 時調用。

---

## 1. 🎬 動畫落地頁 (Animated Landing Page Template)

### 適用情境
產品推廣、SaaS 服務官網、品牌活動一頁式網站。

### 結構精華 (DOM Structure & Classes)
```html
<!-- Hero 區塊：滿版大圖/漸層背景 + 標題動畫 -->
<section class="relative min-h-screen flex items-center justify-center overflow-hidden bg-slate-950 text-white px-6">
  <div class="relative z-10 max-w-4xl text-center">
    <span class="hero-badge inline-block px-4 py-1.5 rounded-full text-xs font-semibold bg-indigo-500/10 text-indigo-400 border border-indigo-500/20 mb-6">
      ✨ 2.0 全新版本重磅登場
    </span>
    <h1 class="hero-title text-5xl md:text-7xl font-extrabold tracking-tight mb-6 leading-tight">
      打造極致高質感的 <span class="bg-gradient-to-r from-indigo-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">數位產品體驗</span>
    </h1>
    <p class="hero-subtitle text-lg md:text-xl text-slate-400 mb-8 max-w-2xl mx-auto">
      專為現代網頁打造的極速開發流程，結合強大設計系統與 GSAP 順暢滾動動畫。
    </p>
    <div class="hero-cta flex flex-col sm:flex-row items-center justify-center gap-4">
      <button class="w-full sm:w-auto px-8 py-4 rounded-xl bg-indigo-600 hover:bg-indigo-500 text-white font-bold transition shadow-lg shadow-indigo-600/30">
        免費開始使用 ➔
      </button>
      <button class="w-full sm:w-auto px-8 py-4 rounded-xl bg-slate-800 hover:bg-slate-700 text-slate-200 font-semibold border border-slate-700 transition">
        預約功能演示
      </button>
    </div>
  </div>
</section>

<!-- 數據統計與成效區 (Stats Counter) -->
<section class="py-20 bg-slate-900 border-y border-slate-800/80">
  <div class="max-w-6xl mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
    <div class="stat-item">
      <div class="stat-number text-4xl md:text-5xl font-extrabold text-white mb-2" data-target="99">0%</div>
      <div class="text-sm text-slate-400">客戶滿意度</div>
    </div>
    <div class="stat-item">
      <div class="stat-number text-4xl md:text-5xl font-extrabold text-indigo-400 mb-2" data-target="10">0x</div>
      <div class="text-sm text-slate-400">開發效率提升</div>
    </div>
    <div class="stat-item">
      <div class="stat-number text-4xl md:text-5xl font-extrabold text-purple-400 mb-2" data-target="500">0+</div>
      <div class="text-sm text-slate-400">企業合作夥伴</div>
    </div>
    <div class="stat-item">
      <div class="stat-number text-4xl md:text-5xl font-extrabold text-pink-400 mb-2" data-target="24">0/7</div>
      <div class="text-sm text-slate-400">全天候技術支援</div>
    </div>
  </div>
</section>
```

### GSAP 現代化動畫配方
```javascript
// Hero 逐項登場
gsap.timeline()
  .from('.hero-badge', { autoAlpha: 0, y: -20, duration: 0.6, ease: 'power2.out' })
  .from('.hero-title', { autoAlpha: 0, y: 30, duration: 0.8, ease: 'power3.out' }, '-=0.3')
  .from('.hero-subtitle', { autoAlpha: 0, y: 20, duration: 0.6 }, '-=0.4')
  .from('.hero-cta', { autoAlpha: 0, scale: 0.95, duration: 0.5 }, '-=0.3');

// 數字滾動觸發遞增 (ScrollTrigger)
gsap.utils.toArray('.stat-number').forEach(num => {
  const target = parseFloat(num.getAttribute('data-target'));
  gsap.to(num, {
    innerText: target,
    duration: 2,
    snap: { innerText: 1 },
    scrollTrigger: { trigger: num, start: 'top 85%' }
  });
});
```

---

## 2. ↔️ 水平滾動視差頁面 (Horizontal Scroll One Page Template)

### 適用情境
品牌故事敘述 (Storytelling)、產品發展史 (Timeline)、展示型藝廊。

### 結構精華
```html
<div class="horizontal-container overflow-x-hidden">
  <div class="horizontal-wrapper flex w-[400vw] h-screen">
    <section class="panel w-screen h-full flex-shrink-0 flex items-center justify-center bg-slate-950 text-white p-12">
      <h2 class="text-6xl font-black">第 1 章：起源與願景</h2>
    </section>
    <section class="panel w-screen h-full flex-shrink-0 flex items-center justify-center bg-indigo-950 text-white p-12">
      <h2 class="text-6xl font-black">第 2 章：突破性創新</h2>
    </section>
    <section class="panel w-screen h-full flex-shrink-0 flex items-center justify-center bg-purple-950 text-white p-12">
      <h2 class="text-6xl font-black">第 3 章：全球生態體系</h2>
    </section>
    <section class="panel w-screen h-full flex-shrink-0 flex items-center justify-center bg-slate-900 text-white p-12">
      <h2 class="text-6xl font-black">第 4 章：邁向未來</h2>
    </section>
  </div>
</div>
```

### GSAP 水平滾動手感控制器 (`pin` + `scrub`)
```javascript
const panels = gsap.utils.toArray('.panel');
gsap.to(panels, {
  xPercent: -100 * (panels.length - 1),
  ease: 'none',
  scrollTrigger: {
    trigger: '.horizontal-container',
    pin: true,
    scrub: 0.8,
    end: () => '+=' + document.querySelector('.horizontal-container').offsetWidth * 2
  }
});
```

---

## 3. 📱 App / SaaS 產品發布頁 (App Landing Page Template)

### 適用情境
iOS/Android App 推廣、SaaS 軟體產品功能發布。

### 結構精華
```html
<section class="py-24 bg-slate-950 text-white overflow-hidden">
  <div class="max-w-6xl mx-auto px-6 grid md:grid-cols-2 gap-12 items-center">
    <!-- 左側說明 -->
    <div>
      <h2 class="text-4xl font-bold mb-6">強大功能，一手掌握</h2>
      <div class="space-y-6">
        <div class="feature-card p-6 rounded-2xl bg-slate-900 border border-slate-800 hover:border-indigo-500/50 transition">
          <div class="text-indigo-400 font-bold mb-2">01. 即時同步</div>
          <p class="text-slate-400 text-sm">跨裝置毫秒級數據同步，確保團隊永遠保持最新進度。</p>
        </div>
        <div class="feature-card p-6 rounded-2xl bg-slate-900 border border-slate-800 hover:border-indigo-500/50 transition">
          <div class="text-purple-400 font-bold mb-2">02. 智能 AI 分析</div>
          <p class="text-slate-400 text-sm">自動歸納業務趨勢，提供精準的決策建議。</p>
        </div>
      </div>
    </div>
    
    <!-- 右側 Mockup 浮空展示 -->
    <div class="relative flex justify-center">
      <div class="phone-mockup relative w-[280px] h-[580px] bg-slate-900 border-8 border-slate-800 rounded-[48px] shadow-2xl shadow-indigo-500/10 overflow-hidden">
        <div class="absolute top-0 left-1/2 -translate-x-1/2 w-32 h-5 bg-slate-800 rounded-b-xl z-20"></div>
        <div class="mockup-screen p-6 pt-12 text-xs">
          <!-- 模擬手機畫面內容 -->
          <div class="h-32 rounded-xl bg-indigo-600/20 border border-indigo-500/30 mb-4 p-3">
            <div class="text-indigo-300 font-bold">即時數據看板</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
```

### GSAP 浮空與滾動視差
```javascript
// 手機 Mockup 浮空呼吸感
gsap.to('.phone-mockup', {
  y: -15,
  duration: 2.5,
  repeat: -1,
  yoyo: true,
  ease: 'sine.inOut'
});

// 滾動漸顯
gsap.from('.feature-card', {
  autoAlpha: 0,
  x: -30,
  stagger: 0.2,
  scrollTrigger: { trigger: '.feature-card', start: 'top 80%' }
});
```

---

## 4. 🎨 個人 / 品牌作品集 (One Page Portfolio Template)

### 適用情境
設計師作品集、顧問個人品牌頁、工作室服務展示。

### 結構精華
```html
<section class="py-24 bg-slate-950 text-white">
  <div class="max-w-6xl mx-auto px-6">
    <div class="flex justify-between items-end mb-12">
      <div>
        <span class="text-indigo-400 text-xs font-bold uppercase tracking-wider">Portfolio</span>
        <h2 class="text-4xl font-extrabold mt-2">精選作品展示</h2>
      </div>
      <a href="#" class="text-sm text-slate-400 hover:text-white transition">查看全部作品 ➔</a>
    </div>
    
    <div class="grid md:grid-cols-2 gap-8">
      <div class="portfolio-item group relative rounded-2xl overflow-hidden bg-slate-900 border border-slate-800">
        <div class="aspect-video bg-slate-800 overflow-hidden">
          <div class="w-full h-full bg-gradient-to-br from-indigo-900/40 to-purple-900/40 group-hover:scale-105 transition duration-500"></div>
        </div>
        <div class="p-6">
          <span class="text-xs text-indigo-400">UI/UX Design</span>
          <h3 class="text-xl font-bold mt-1 mb-2">Fintech 行動支付 App</h3>
          <p class="text-slate-400 text-sm">全新直覺式支付流程設計，提升 35% 轉化率。</p>
        </div>
      </div>
    </div>
  </div>
</section>
```

### GSAP 錯開登場與 Hover 物理緩動
```javascript
gsap.from('.portfolio-item', {
  autoAlpha: 0,
  y: 40,
  stagger: 0.15,
  duration: 0.8,
  ease: 'power2.out',
  scrollTrigger: { trigger: '.portfolio-item', start: 'top 85%' }
});
```
