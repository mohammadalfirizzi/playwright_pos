Feature: Login to application Odoo

 Scenario: TC0101 - Transaksi 1 product with use membership registered
    Given I open the login page
        When I enter my "admin@admin.com" as username and "admin" as password
        Then I should see the dashboard page

    Given I open the POS Menu
        When I enter continue selling POS Menu
        Then I should see the POS Page Detail
        When I enter "1" "Iphone 13 Pro Max" as Product, 1 as Qty Product, "rizzi" as Customer and "True"
        And I processed the payment
        Then Payment Successfully

 Scenario: TC0102 - Transaksi 2 product with use membership registered
    Given I open the login page
        When I enter my "admin@admin.com" as username and "admin" as password
        Then I should see the dashboard page

    Given I open the POS Menu
        When I enter continue selling POS Menu
        Then I should see the POS Page Detail
        When I enter "1" "Iphone 13 Pro Max" as Product, 1 as Qty Product, "rizzi" as Customer and "True"
        When I enter "2" "Case Iphone 13 Pro Max" as Product, 1 as Qty Product, "rizzi" as Customer and "True"
        And I processed the payment
        Then Payment Successfully


Scenario: TC0103 - Transaksi 1 produk dengan membership tidak terdaftar
    Given I open the login page
      When I enter my "admin@admin.com" as username and "admin" as password
      Then I should see the dashboard page

    Given I open the POS Menu
      When I enter continue selling POS Menu
      Then I should see the POS Page Detail
      When I enter "1" "Iphone 13 Pro Max Bukan Membership" as Product, 1 as Qty Product, "test" as Customer and "False"
      Then I should see alert notification for invalid membership
      When I processed the payment
      Then Payment Successfully

  Scenario: TC0104 - Transaksi multiple produk dengan membership tidak terdaftar
    Given I open the login page
      When I enter my "admin@admin.com" as username and "admin" as password
      Then I should see the dashboard page

    Given I open the POS Menu
      When I enter continue selling POS Menu
      Then I should see the POS Page Detail
      When I enter "1" "Iphone 13 Pro Max Bukan Membership" as Product, 1 as Qty Product, "test" as Customer and "False" 
      When I enter "2" "Case Iphone 13 Pro Max Bukan Membership" as Product, 1 as Qty Product, "test" as Customer and "False" 
      Then I should see alert notification for invalid membership
      When I processed the payment
      Then Payment Successfully

Scenario: TC0105 - Transaksi dengan membership expired hari ini
    Given I open the login page
      When I enter my "admin@admin.com" as username and "admin" as password
      Then I should see the dashboard page

    Given I open the POS Menu
      When I enter continue selling POS Menu
      Then I should see the POS Page Detail
      When I enter "1" "Iphone 13 Pro Max Expired" as Product, 1 as Qty Product, "test" as Customer and "False"
      And I processed the payment
      Then Payment Successfully


Scenario: TC0106 - Transaksi dengan membership expired sebelum hari ini
    Given I open the login page
      When I enter my "admin@admin.com" as username and "admin" as password
      Then I should see the dashboard page

    Given I open the POS Menu
      When I enter continue selling POS Menu
      Then I should see the POS Page Detail
      When I enter "1" "Iphone 13 Pro Max Expired" as Product, 1 as Qty Product, "test" as Customer and "False"
      And I processed the payment
      Then Payment Successfully


Scenario: TC0108 - Transaksi dengan membership terdaftar namun total transaksi = 0
    Given I open the login page
      When I enter my "admin@admin.com" as username and "admin" as password
      Then I should see the dashboard page

    Given I open the POS Menu
      When I enter continue selling POS Menu
      Then I should see the POS Page Detail
      When I enter "1" "Iphone 13 Pro Max" as Product, 0 as Qty Product, "rizzi" as Customer and "True"
      And I processed the payment
      Then Payment Successfully

Scenario: TC0109 - Transaksi dengan membership terdaftar namun total transaksi < 0
    Given I open the login page
      When I enter my "admin@admin.com" as username and "admin" as password
      Then I should see the dashboard page

    Given I open the POS Menu
      When I enter continue selling POS Menu
      Then I should see the POS Page Detail
      When I enter "1" "Iphone 13 Pro Max" as Product, +/- as Qty Product, "rizzi" as Customer and "True"
      And I processed the payment
      Then Payment Successfully

Scenario: TC0110 - Transaksi lebih dari 1000 item menggunakan membership yang terdaftar
    Given I open the login page
      When I enter my "admin@admin.com" as username and "admin" as password
      Then I should see the dashboard page

    Given I open the POS Menu
      When I enter continue selling POS Menu
      Then I should see the POS Page Detail
      When I enter "1" "Virtual Home Staging" as Product, 1 as Qty Product, "rizzi" as Customer and "True"
      And I enter "10", "Virtual Home Staging" as Product
      And I processed the payment
      Then Payment Successfully