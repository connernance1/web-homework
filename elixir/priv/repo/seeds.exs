# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Homework.Repo.insert!(%Homework.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Homework.Repo
alias Homework.Users.User
alias Homework.Merchants.Merchant
alias Homework.Transactions.Transaction
alias Homework.Companies.Company

# Repo.insert!(%User{
#     dob: "11/05/1996",
#     first_name: "Conner",
#     last_name: "Nance"
# })

# Repo.insert!(%Merchant{
#     name: "PayPal",
#     description: "PayPal is a large company",
# })

# Repo.insert!(%Company{
#     name: "Divvy",
#     credit_line: 1000,
#     available_credit: 0
# })

Repo.insert! %Transaction{
    amount: 1000,
    description: "This is a 1000 dollar transaction",
    credit: false,
    debit: true,
    user_id:  "17ee2ca2-5374-416d-8912-a05a191115b6",
    merchant_id: "451c5489-f678-40ac-9e32-95ed2fdc0b49",
    company_id:  "a2e0ebf0-1742-4251-b2f0-effad67ddae5"
    # ids will change each time db is dropped/re-setup...
}
