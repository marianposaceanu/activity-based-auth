# Activity Based Authorization with Pundit

The basic idea is that we should avoid checking the role for authorization and instead check for the current action (renamed as activity due to the overloading of the name by the MVC pattern)

##### How it works:

- instead of complicating our domain with Permissions or something similar we use reflection for auth.
- we store the activities into an ARRAY type column in the roles table (we can update this to JSONB)
- we use reflection to generate a key per action e.g. 'class:method_name', this is the most basic version
- the Policies in Pundit are only required for exceptional cases (scopes or when something really depends on the Role, think of scopes)

##### How to play with it:

```
$ bundle
$ rails db:setup
$ rails s
```

- GET /articles => simple scaffolded resource
- use `?role={ admin or simpleton }` to change the Role on the fly and play with the code

##### How to manage the activities

One issue is that for dynamic, editable permissions something like 'article:update' makes no sense to the app user and leaks details into the UI hence:

```yaml
admin:
   - action: article:index
     description: Show the full articles
   - action: article:show
     description: Show one article
simpleton:
   - action: article:show
     description: Show one article
```

in `config\activities.yml`

We can describe them a priori in a simple, centralised, YML file.

##### Source files of interest:

- https://github.com/dakull/activity-based-auth/blob/master/config/activities.yml
- https://github.com/dakull/activity-based-auth/blob/master/app/policies/application_policy.rb

##### Notes:

The roles and users tables are just mock-ups.

##### Credits:

- https://lostechies.com/derickbailey/2011/05/24/dont-do-role-based-authorization-checks-do-activity-based-checks/
