---
name: fal-ai-mcp-server
description: >-
  Generate images (Flux.1 Dev, Flux 1.1 Pro, SD3.5 Large, LoRA), edit images (Gemini Flash Edit),
  or generate videos (Wan-I2V Turbo, HunyuanVideo, Kling AI Pro) using Fal.ai APIs via fal-ai-mcp-server.
  Trigger when the user asks to generate, edit, or create AI images, artwork, Flux graphics, LoRA images, or AI videos using Fal.ai.
---

# Fal.ai Image & Video Generation Skill (Upgraded)

This skill provides workflow guidance and tool usage for `fal-ai-mcp-server`, supporting flagship AI image generation, LoRA styling, image editing, and high-definition video synthesis using Fal.ai APIs.

## Available Tools & Models

### 🖼️ Image Generation Tools

1. **`generate_image` (Flux.1 Dev)**
   * **Model**: `fal-ai/flux/dev`
   * **Use case**: Standard high-quality image generation from text prompts.
   * **Arguments**: `prompt` (string), `aspect_ratio` (string: "1:1", "16:9", "9:16", "4:3", "3:4"), `seed` (int, optional).

2. **`generate_image_flux_pro` (Flux 1.1 Pro Flagship)**
   * **Model**: `fal-ai/flux-pro/v1.1`
   * **Use case**: Premium studio-quality image generation with maximum detail and prompt adherence.
   * **Arguments**: `prompt` (string), `aspect_ratio` (string, default "16:9"), `seed` (int, optional).

3. **`generate_image_sd35` (Stable Diffusion 3.5 Large)**
   * **Model**: `fal-ai/stable-diffusion-v35-large`
   * **Use case**: High-resolution image generation using SD3.5 Large architecture.
   * **Arguments**: `prompt` (string), `aspect_ratio` (string), `num_inference_steps` (int), `seed` (int, optional).

4. **`generate_image_lora` (Flux.1 with LoRA Styling)**
   * **Model**: `fal-ai/flux-lora`
   * **Use case**: Apply custom LoRA fine-tuned weights or character styles.
   * **Arguments**: `prompt` (string), `lora_url` (string URL to `.safetensors`), `lora_scale` (float), `aspect_ratio` (string).

5. **`edit_image` (Gemini Flash Image Editing)**
   * **Model**: `fal-ai/gemini-flash-edit`
   * **Use case**: Instruction-based image editing and inpainting on existing images.
   * **Arguments**: `prompt` (string), `image_path` (string local path).

---

### 🎬 Video Generation Tools

6. **`generate_video` (Wan-I2V Turbo Image-to-Video)**
   * **Model**: `fal-ai/wan-i2v/turbo`
   * **Use case**: Fast 81-frame 16fps 480p MP4 animation from an initial image.
   * **Arguments**: `prompt` (string), `image_path` (string), `negative_prompt` (string, optional).

7. **`generate_video_hunyuan` (HunyuanVideo Flagship)**
   * **Model**: `fal-ai/hunyuan-video`
   * **Use case**: Cinematic 85-frame open-source video generation (Text-to-Video / Image-to-Video).
   * **Arguments**: `prompt` (string), `image_path` (string, optional), `aspect_ratio` (string, default "16:9").

8. **`generate_video_kling` (Kling AI v1.5 Pro)**
   * **Model**: `fal-ai/kling-video/v1.5/pro`
   * **Use case**: Photorealistic video generation with fluid motion.
   * **Arguments**: `prompt` (string), `image_path` (string, optional), `duration` (string: "5" or "10").

---

## Environment & Storage
* **MCP Configuration File**: `C:\Users\ASUS\.gemini\config\mcp_config.json`
* **API Key Requirement**: Requires `FAL_KEY` configured in `mcp_config.json`.
* **Output Folder**: Generated PNG/MP4 media files are saved to:
  `C:\Users\ASUS\.gemini\antigravity\scratch\fal_media`
