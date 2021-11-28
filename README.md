# The MealDB API

This gem is for educational use only. I have created this to have a practice on how to create an API wrapper for Rails and create it in a ruby gem.

You may check The MealDB website [here](https://www.themealdb.com/api.php). The API and their site will always remain free at point of access. If you love their service and want extra features you can sign up as a [Patreon supporter](https://www.patreon.com/thedatadb) for $2.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'themealdb_rubygem'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install themealdb_rubygem
    
## Usage


### Configure
Instance of the client must be done first before being able to use the API. Since The MealDB have endpoints for free users and paid users, you can just create an instance without passing any api_key.

#### free

```ruby
client = ThemealdbRubygem::Client.new
```

#### with api key (paid)

```ruby
client = ThemealdbRubygem::Client.new(api_key: YOUR_API_KEY)
```

### Search meal by name

```ruby
client.search_by_name("Arrabiata")
```

### Search by first letter

```ruby
client.search_by_first_letter("a")
```

### Search by ID

```ruby
client.search_by_id("52772")
```

### Random Meal

```ruby
client.random_meal
```

### List all categories with full description

```ruby
client.list_categories_full
```

### List all categories

```ruby
client.list_categories
```

### List all area

```ruby
client.list_areas
```

### List all ingredients

```ruby
client.list_ingredients
```

### Filter by main ingredient
Note that for paid users (those with api keys), ingredient variable can hold multiple strings (ingredient = "chicken_breast,garlic,salt").

```ruby
client.filter_by_main_ingredient("chicken breast")
```

### Filter by category

```ruby
client.filter_by_category("Seafood")
```

### Filter by area

```ruby
client.filter_by_area("Canadian")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michael-dollosa/themealdb_rubygem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/michael-dollosa/themealdb_rubygem/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TheMealDB API project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/michael-dollosa/themealdb_rubygem/blob/master/CODE_OF_CONDUCT.md).
