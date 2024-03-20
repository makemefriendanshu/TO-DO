# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TODO.Repo.insert!(%TODO.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias TODO.Accounts
alias TODO.Accounts.RelationshipType

# for _ <- 6..10,
#     do:
#       Accounts.create_user(%{
#         name: Faker.Name.name(),
#         email: Faker.Internet.email(),
#         password: "#include<stdio.h>"
#       })

# # followers/followings relationships
# users = Accounts.list_users()
# user = Enum.at(users, 0)
# following = Enum.slice(users, 7, 10)
# followers = Enum.slice(users, 8, 10)

# for followed <- following, do: Accounts.follow(followed, user)
# for follower <- followers, do: Accounts.follow(user, follower)

# for _ <- 6..10,
#     do:
Accounts.create_relationship_type(%{
  name: "Friend",
  type: "Girl"
})

Accounts.create_relationship_type(%{
  name: "Friend",
  type: "Boy"
})
