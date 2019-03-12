# EnumFromFile
If you've ever found yourself in a situation where you feel like you should use enum, but it has 50 potions so you don't know where to put it, the answer is here!

Just store your enums in a .yml file!

This makes little sense when you have a small enum with just a couple of options, but the more options you have, the easier it is to see the benefits of using it.

## Usage
1. Create a folder `/config/enums` to store your enum files in .yml format.
2. Add `include EnumFromFile` to the `ApplicationRecord` or your target model.
3. Make sure your enum column has a type `string`.

Et voila!

Given a file `/config/enums/eye_colors.yml` you add eye_color enum to a Cat model with the following line:
```ruby
enum :eye_color, from_file: :eye_colors
```

You can continue using regular syntax for regular cases:
```ruby
enum status: { active: active, archived: archived }
```

All the options will be passed to native enum implementation as expected.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'enum_from_file'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install enum_from_file
```

## Contributing
Bug reports and pull requests are welcome on project's [page](https://github.com/andrewr224/enum-from-file) at GitHub

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).