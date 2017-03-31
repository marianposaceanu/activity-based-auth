# Activity Based Authorization with Pundit

The basic idea is that we should avoid checking the role for auth. and instead checking for the action (renamed as activity due to the overloading of the name by the MVC pattern)


How it works:

- instead of complicating our domain with Permissions or something similar we use reflection for auth.
- we store the permitted activities into an ARRAY type column in the roles table (we can update this to JSONB)
- we use reflection to generate a key per action e.g. 'class:method_name', this is the most basic version
- the Policies in Pundit are only required for exceptional cases (scopes or when something really depends on the Role think scopes)

How to play with it:

```
$ bundle
$ rails db:setup
```

GET /articles => simple scaffolded rerource
use `?role={ admin or simpleton }` to change the Role on the fly and play with the code

Notes:

The roles and users tables are just mock-ups.
