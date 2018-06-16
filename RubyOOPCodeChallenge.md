# The Challenge

Should you choose to accept it...

## Summary

Humi Payroll is a SaaS payroll system designed for Canadian businesses. The multi-tenant system hosts all clients on a single-database, multi-schema Rails application. For the purposes of this challenge, there is no need to account for the details of the multi-tenancy implementation or database in models or migrations.

* Please use Ruby to complete this challenge
* Please follow Rails patterns and conventions
* While we follow a (slightly modified version of) the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide), there are no specific stylistic requirements for this challenge.
* Please use a file structure similar to that of a standard Rails application (eg. app/models, db/migrations, etc.)
* While you may submit an entire rails application, submitting the files that extend an existing rails application is perfectly fine too.


## Part 1

Assume there is a table named `people` with several attributes related to an individual:

  * `first_name`
  * `last_name`
  * `date_of_birth`
  * `marital_status`
  * `social_insurance_number`
  * `hire_date`
  * `preferences`

Create an Employee model

  * Please include validations
  * Please recommend datatypes for each attribute
  * Ensure we can get an individual's full name


## Part 2

Some employees are also administrators and will have different privileges (eg. the ability to change compensation for all employees)

* The front-end requires an attribute called `is_admin`
* Please write or modify any classes that are needed
* Write any migrations if needed


Given the following API endpoint:

```ruby
# GET /v1/people/:id
def show
  # code here

  render @person, status: :ok
end
```

How you would initialize a person that may be either an Employee or Administrator. Please describe in a comment (no code needed) how you suggest serialization occur (ie. any gems or conventions you would use).


## Part 3

Humi has signed a large deal with GMPK, a large accounting firm whose clients will all use Humi Payroll. Some accountants will need administrator-level access with their clients, but they are not employees.

Please write any additional models, concerns, migrations, and refactorings you would make to accommodate accountants.


## Part 4

Penguin Pastries, a large client of Humi, has requested that certain employees have some privileges of administrators (such as the ability to add hours to an employee's timesheet) but not others (such as the ability to change an employee's salary).

Please write any additional models, concerns, migrations, and refactorings you would make to accommodate this request. Please keep in mind that in the future other companies may request different types of permissions.

