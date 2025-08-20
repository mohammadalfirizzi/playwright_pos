from playwright.sync_api import sync_playwright, expect
from behave import given, when, then

@given('I open the login page')
def step_given_open_login_page(context):
    context.page.goto("https://testblc.odoo.com/odoo")

@when('I enter my "{username}" as username and "{password}" as password')
def step_when_enter_credentials(context, username, password):
    context.page.get_by_placeholder("Email").fill(username)
    context.page.get_by_placeholder("Password").fill(password)
    context.page.get_by_role("button", name="Log in").click()

@then('I should see the dashboard page')
def step_then_see_dashboard(context):
    context.page.wait_for_selector('text=Discuss')
    assert context.page.is_visible("text=Discuss")