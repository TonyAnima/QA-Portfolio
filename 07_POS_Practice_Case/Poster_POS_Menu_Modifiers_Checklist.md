# Practice Case: Poster POS Menu & Modifiers QA Checklist

- **System:** Poster POS (Back-office Admin Panel & Register Screen)
- **Context:** Practical hands-on configuration and verification of menu categories, items, and modifier groups.

## 1. Category & Menu Item Setup
- [x] New menu categories appear in the correct order on the POS register screen
- [x] Menu item names, base prices, and tax settings save accurately in Back-office
- [x] Disabled/archived items are hidden from the active register screen

## 2. Modifiers & Add-Ons Logic
- [x] Single-select modifier groups (e.g., Cup Size: S / M / L) allow only one active choice
- [x] Multi-select modifier groups (e.g., Toppings / Syrups) allow multiple selections up to configured max limit
- [x] Required modifiers block adding the item to the receipt until a choice is selected
- [x] Optional modifiers allow proceeding without selection

## 3. Price Calculation & Receipt Verification
- [x] Base item price + paid modifier price calculates accurately on the register screen
- [x] Free modifiers (`+0 THB`) display clearly on the kitchen ticket without altering total price
- [x] Editing item quantity updates both base price and attached modifier totals proportionally
- [x] Removing an item from the active order clears its attached modifiers cleanly
