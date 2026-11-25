# BUG-002: User can complete checkout with an empty shopping cart ($0.00 order)

| Field | Details |
| :--- | :--- |
| **Bug ID** | BUG-002 |
| **Severity** | High |
| **Priority** | High |
| **Status** | Open |
| **Environment** | Chrome 131 (macOS), Desktop 1440×900 |
| **URL** | [https://www.saucedemo.com/cart.html](https://www.saucedemo.com/) |
| **Test Account** | `standard_user` / `secret_sauce` |
| **Related Test Case** | `TC-013` |

## Preconditions
User is logged in as `standard_user` and has **0 items** in the shopping cart.

## Steps to Reproduce
1. Click the empty shopping cart icon in the top-right corner.
2. On `/cart.html`, observe that the `Checkout` button is active and click it.
3. Fill in valid customer information (`First Name: Anton`, `Last Name: Zverkov`, `Postal Code: 10110`) and click `Continue`.
4. On `/checkout-step-two.html`, observe `Item total: $0`, `Tax: $0.00`, `Total: $0.00`.
5. Click `Finish`.

## Expected Result
The `Checkout` button should be disabled when the cart is empty, or the system should display a validation message prompting the user to add at least one item before checkout.

## Actual Result
The application allows the user to proceed through all checkout steps and displays the order confirmation screen (`Thank you for your order!`) for a `$0.00` empty order.

## Business Impact
Empty orders can pollute backend order databases, trigger unnecessary confirmation emails, and distort sales/operations analytics.
