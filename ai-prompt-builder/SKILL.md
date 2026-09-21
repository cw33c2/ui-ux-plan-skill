---
name: ai-prompt-builder
description: Comprehensive workflow and instructions for scaffolding, building, and styling an AI Image Prompt Builder in Next.js with Zustand state management, Tailwind CSS, Midjourney parameter assembly, Gemini AI integration, and Excel tag import/export capabilities. Trigger when building an AI Prompt Builder, Midjourney prompt generator, or managing prompt dictionary tags.
---

# AI Prompt Builder Skill

This skill provides comprehensive architectural guidance, data schemas, and state assembly workflows for building a high-performance **AI Image Prompt Builder** using Next.js 14 (App Router), TypeScript (Strict Mode), Zustand, and Tailwind CSS.

---

## 1. Core Architecture & Stack

- **Framework**: Next.js 14 App Router (`src/app/prompt-builder/page.tsx`)
- **State Management**: Zustand with `persist` middleware (`src/store/usePromptStore.ts`)
- **UI Styling**: Tailwind CSS with custom dark sci-fi aesthetic (`#08080f` background, glowing borders)
- **External Integration**: 
  - `xlsx` (SheetJS) for Excel tag import/export
  - Google Gemini 1.5 Flash API for prompt translation & magic expansion

---

## 2. Golden Order Prompt Assembly Pipeline

When assembling Midjourney prompts, enforce the **Golden Order Pipeline**:

1. **Image Prompt Prefix**: `[Image URL] --iw [Weight]`
2. **Positive Keyphrases**: `[Custom Theme] + [Active Snippets] + [Subject] + [Style] + [Lighting] + [Mood] + [Camera] + [Quality]`
3. **Negative Prompt**: `--no [Negative Tags]`
4. **References**: `--sref [Style URL] --sw [Weight] --cref [Char URL] --cw [Weight]`
5. **MJ Parameters**: `--v [Version] --ar [Ratio] --s [Stylize] --c [Chaos] --weird [Weird] --seed [Seed]`

---

## 3. Data Schema & Types

```typescript
export interface TagItem {
  zh: string;
  en: string;
}

export interface CategoryItem {
  id: string;
  emoji: string;
  label: string;
  dot: string;
  neg: boolean;
  tags: TagItem[];
}

export interface MjParams {
  version: string;
  ar: string;
  q: string;
  s: number;
  c: number;
  w: number;
  seed: string;
}

export interface RefParams {
  imgUrl: string;
  imgWeight: number;
  srefUrl: string;
  srefWeight: number;
  crefUrl: string;
  crefWeight: number;
}
```

---

## 4. Key Components Breakdown

- **`Header.tsx`**: Title bar with "📥 匯出 Excel" and "📤 匯入 Excel (完全取代)" buttons.
- **`SelectedTagsBar.tsx`**: Full-width top bar displaying selected tags as Chinese pills (`✅ 已選標籤 (點擊移除)`).
- **`LeftColumn.tsx`**: Category accordion menu and "🎲 給我隨機靈感 (Random Inspiration)" generator.
- **`MiddleColumn.tsx`**: Custom text input, Snippets Vault, Advanced Reference controls (--sref, --cref), and MJ parameters slider console.
- **`RightColumn.tsx`**: Sticky live prompt output box with one-click clipboard copy and character counter.

---

## 5. Verification Checklist

1. Run `npm run type-check` (`tsc --noEmit`) -> Ensure **0 Errors**.
2. Run `npm run lint` (`next lint`) -> Ensure **0 Warnings/Errors**.
3. Verify LocalStorage hydration using `prompt-builder-storage-v3` key.
