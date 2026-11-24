"""Print WCAG contrast of each Ukiyo syntax and UI color against its variant's background.

Run from the repo root: python3 scripts/contrast.py
"""
import re

PALETTE = "lua/ukiyo/colors.lua"
TEXT_ROLES = ["Fg", "FgDim", "Comment", "Keyword", "Func", "String", "Type", "Number", "Constant",
              "Field", "Operator", "Builtin", "Punct", "Param", "Escape", "Error", "Warn", "Info", "Hint"]


def luminance(hex_color):
    channels = [int(hex_color[i:i + 2], 16) / 255 for i in (1, 3, 5)]
    r, g, b = [c / 12.92 if c <= 0.03928 else ((c + 0.055) / 1.055) ** 2.4 for c in channels]
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def contrast(a, b):
    hi, lo = sorted((luminance(a), luminance(b)), reverse=True)
    return (hi + 0.05) / (lo + 0.05)


colors = dict(re.findall(r'(\w+)\s*=\s*"(#[0-9A-Fa-f]{6})"', open(PALETTE).read()))
for variant in ("umi", "yoru", "kami"):
    bg, cursorline, visual = (colors[variant + k] for k in ("Bg", "BgP2", "Visual"))
    print(f"{variant}  (bg {bg})          bg  cursorline  visual")
    for role in TEXT_ROLES:
        c = colors[variant + role]
        print(f"  {role:9} {c}   {contrast(c, bg):5.2f}  {contrast(c, cursorline):10.2f}  {contrast(c, visual):6.2f}")
    print()
