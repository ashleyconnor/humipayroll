# README

## Questions

### How you would initialize a person that may be either an Employee or Administrator?

```ruby
# GET /v1/people/:id
def show
  @person = Person.find_by_id(params[:id])

  render @person, status: :ok
end
```

With a `is_admin` flag on the people table - admins can be initialized in the same way as other employees. If we want to fetch only employees that are admins, we can add `is_admin: true` to our
database queries - although it's better to set a scope on our employee model along the lines of:

```ruby
scope :admins, -> { where(is_admin: true) }
```

We can then use `Employee.admins` to work only with administrators.

There's also Single Table Inheritance where would could define a people table and then have 2 classes extend from that. These classes (Employee, Administrator) could then implement their own functionality whilst sharing a base.

### Please describe in a comment (no code needed) how you suggest serialization occur (ie. any gems or conventions you would use).

Creating an serializer using `ActiveModel::Serializer` is usually the way to go.

Rails also ships with `jBuilder` which allows us to define JSON views using a template.

### Humi has signed a large deal with GMPK, a large accounting firm whose clients will all use Humi Payroll. Some accountants will need administrator-level access with their clients, but they are not employees.

At this point it's probably wise to introduce authorization roles and policy objects to determine permissionable actions rather than spinning off new models for each role type.

The best gem for roles is `rolify`.

I'd move `is_admin` into an admin role and remove the column on the people table.

For accountants we can scope their permissions to employees that belong to their organization, any extra permissions could only be actioned on those employees.

We can use Policy objects with the `pundit` gem to check that the required roles are present for certain actions.