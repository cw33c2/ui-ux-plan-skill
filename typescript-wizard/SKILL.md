---
name: typescript-wizard
description: TypeScript coding guidelines inspired by Matt Pocock, focusing on strict typing, no implicit any, and advanced generic patterns.
---

# TypeScript Wizard

Use this skill whenever you write or review TypeScript code. It applies best practices inspired by Matt Pocock.

## Core Rules
1. **Strict Type Checking:** Always assume `strict: true` in tsconfig.json.
2. **Avoid `any`:** Never use `any`. Use `unknown` if the type is truly not known ahead of time, and narrow it down with type guards.
3. **Explicit Return Types:** Always define explicit return types for functions, especially exported ones.
4. **Prefer `type` over `interface`:** Use `type` for defining shapes and object types by default unless you specifically need declaration merging.
5. **Use Discriminated Unions:** Prefer discriminated unions for representing state over multiple optional properties.
6. **No Enums:** Prefer string literal unions (`type Status = "idle" | "loading" | "success"`) over TypeScript `enum`s.
7. **Generic Type Parameters:** Use descriptive names for generic types (e.g., `TData`, `TError` instead of just `T`).
8. **Zod for Validation:** Recommend Zod for runtime type validation when parsing external data.

Apply these rules strictly to any TypeScript code generation.
