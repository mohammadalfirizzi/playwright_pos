from playwright.sync_api import sync_playwright, expect
from behave import given, when, then

@given('I open the POS Menu')
def step_given_open_pos_menu(context):
    context.page.get_by_role("option", name="Point of Sale").click()

@when('I enter continue selling POS Menu')
def step_when_enter_selling_pos_menu(context):
    context.page.get_by_role("button", name="Continue Selling").click()

@when('I enter "{th_product}" "{product_name}" as Product, {qty_product} as Qty Product, "{customer}" as Customer and "{membership}"')
def step_when_enter_product(context, th_product, product_name, customer, membership, qty_product):
    context.page.get_by_role("textbox", name="Search products...").click()
    context.page.get_by_role("textbox", name="Search products...").fill(product_name)
    context.page.get_by_text(product_name, exact=True).click()
    expect(context.page.get_by_role("listitem").get_by_text(product_name, exact=True)).to_be_visible()
    context.page.get_by_role("button", name="Qty").click()
    context.page.get_by_role("button", name=qty_product, exact=True).click()
    if th_product == "1":
        context.page.get_by_role("button", name="Customer").click()
        context.page.get_by_role("cell", name=customer, exact=True).click()
        expect(context.page.get_by_role("button", name=customer)).to_be_visible()
    if membership == True:
        total_text = context.page.locator("span.total").inner_text() 
        total_number = float(total_text.replace("Rp", "").replace("\xa0", "").replace(",", ""))  
        value_text = context.page.locator("span.value.text-success").inner_text()
        value_number = float(value_text.replace("+", ""))  
        assert total_number == value_number, f"Mismatch: {total_number} != {value_number}"

@when('I enter "{line_items}", "{product_name}" as Product')
def step_when_line_items(context, line_items, product_name):
    for i in range(int(line_items)):
        context.page.get_by_label(product_name, exact=True).get_by_text(product_name).click()
        # expect(context.page.get_by_role("listitem").get_by_text(product_name, exact=True)).to_be_visible()

@when('I processed the payment')
def step_when_process_payment(context):
    context.page.get_by_role("button", name="Payment").click()
    context.page.locator("div.button.paymentmethod >> text=Cash").click()
    context.page.get_by_role("button", name="Validate").click()


@then('I should see alert notification for invalid membership')
def step_then_see_alert_notif(context):
    context.page.locator("button.btn.btn-secondary.more-btn").click()
    context.page.get_by_role("button", name=" Enter Code").click()
    context.page.get_by_role("textbox", name="Gift card or Discount code").click()
    context.page.get_by_role("textbox", name="Gift card or Discount code").fill("tidak valid")
    context.page.get_by_role("button", name="Apply").click()
    expect(context.page.get_by_text("This coupon is invalid (tidak valid)")).to_be_visible()

@then('Payment Successfully')
def step_then_payment_successfully(context):
    expect(context.page.get_by_text("Payment Successful")).to_be_visible()

@then('I should see the POS Page Detail')
def step_then_see_pos_page(context):
    expect(context.page.get_by_role("heading", name="Start adding products")).to_be_visible()


