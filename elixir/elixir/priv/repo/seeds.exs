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

c = Repo.insert!(%Company{
    name: "Divvy",
    credit_line: 30000,
    available_credit: 15000
})

u = Repo.insert!(%User{
    dob: "04/15/1994",
    first_name: "Cathy",
    last_name: "Nance"
})

m = Repo.insert!(%Merchant{
    name: "Merchant C",
    description: "This is merchant C",
})



Repo.insert! %Transaction{
    amount: 3000,
    description: "This is a 3000 dollar transaction",
    credit: false,
    debit: true,
    user_id:  u.id,
    merchant_id: m.id,
    company_id:  c.id
    # ids will change each time db is dropped/re-setup...
}
